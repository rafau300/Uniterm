using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Media;
using System.Drawing;
using System.Drawing.Imaging;

namespace Uniterm_ASP
{
    public class MyDrawing
    {

        #region Fields

        public static Pen pen
        {
            get
            {
                return new Pen(Brushes.SteelBlue, (int)Math.Log(fontsize, 3));
            }
        }

        private static Brush br = Brushes.White;

        public static FontFamily fontFamily = new FontFamily("Arial");

        public static int fontsize = 12;

        public static string sA, sB, sOp;

        public static string eA, eB, eC;

        public static char oper = ' ';

        private int Width = 700, Height = 450;

        private Bitmap bp;
        private Graphics G;

        public Bitmap UnitermBitmap
        {
            get
            {
                return bp;
            }
        }
        #endregion

        #region Initalizers

        public MyDrawing()
        {
            bp = new Bitmap(this.Width, this.Height);
            G = Graphics.FromImage(bp);
            G.FillRectangle(Brushes.AntiqueWhite, 0, 0, this.Width, this.Height);
        }

        #endregion

        #region Public Methods


        public void Redraw()
        {
            if (oper != ' ')
            {
                DrawSwitched(new Point(20, fontsize + 30));
            }
            else
            {
                if (sA != "")
                {
                    DrawSek(new Point(30, fontsize + 30));
                }
                if (eA != "")
                {
                    DrawElim(new Point(30, fontsize * 3 + 30));
                }
            }
        }


        public static void ClearAll()
        {
            sA = sB = sOp = "";
            eA = eB = eC = "";
            oper = ' ';
        }

        public void DrawSek(Point pt)
        {
            if (sA == "" || sOp == "") return;
            int len = GetTextLength(sA + sOp + sB);

            DrawText(pt, sA + sOp + sB);
            DrawBezier(new Point(pt.X, pt.Y - 1), len);
        }

        public void DrawElim(Point pt)
        {
            if (eA == "" || eB == "" || eC == "") return;

            Point p2 = new Point(pt.X + 2, pt.Y);
            string text = eA + Environment.NewLine.ToString() + ";" + Environment.NewLine.ToString() +
                eB + Environment.NewLine.ToString() +
                ";" + Environment.NewLine.ToString() + eC;

            double l = GetTextHeight(text) + 2;

            DrawText(p2, text);
            DrawVert(pt, (int)l);
        }

        public void DrawSwitched(Point pt)
        {
            if (sA == "" || sOp == "" || eA == "" || eB == "" || eC == "") return;


            string textElim = eA + Environment.NewLine.ToString() + ";" + Environment.NewLine.ToString() +
                eB + Environment.NewLine.ToString() +
                ";" + Environment.NewLine.ToString() + eC;

            int length = GetTextLength(textElim);

            sOp = " " + sOp + " ";

            if (oper == 'A')
            {
                DrawText(new Point(pt.X + length + (fontsize / 3), pt.Y + 3), sOp + sB);
                DrawElim(new Point(pt.X + (fontsize / 3), pt.Y + 3));
                length += GetTextLength(sOp + sB) + (int)(fontsize / 3);
            }
            if (oper == 'B')
            {
                DrawText(pt, sA + sOp);
                DrawElim(new Point(pt.X + GetTextLength(sA + sOp) + (fontsize / 3), pt.Y));
                length += GetTextLength(sA + sOp) + (int)(fontsize / 3);
            }
            sOp = Convert.ToString(sOp[1]);
            DrawBezier(pt, length + 5); //+5 poniewaz Kreska tyle zajmuje

        }
        #endregion

        #region Private Methods

        private void DrawVert(Point pt, int length)
        {
            G.DrawLine(pen, pt, new Point { X = pt.X, Y = pt.Y + length });
            double b = (Math.Sqrt(length) / 2) + 2;

            G.DrawLine(pen, new Point((int)(pt.X - (b / 2)), (int)pt.Y), new Point((int)(pt.X + (b / 2)), (int)pt.Y));
            G.DrawLine(pen, new Point((int)(pt.X - (b / 2)), (int)(pt.Y + length)), new Point((int)(pt.X + (b / 2)), pt.Y + length));

        }

        private void DrawBezier(Point p0, int length)
        {
            Point start = p0;
            Point p1 = new Point(), p2 = new Point(), p3 = new Point();

            p3.Y = p0.Y;
            p3.X = p0.X + length;

            int b = (int)Math.Sqrt(length) + 2;

            p1.X = p0.X + (int)(length * 0.25);
            p1.Y = p0.Y - b;


            p2.X = p0.X + (int)(length * 0.75);
            p2.Y = p0.Y - b;

            foreach (Point pt in GetBezierPoints(p0, p1, p2, p3))
            {
                G.DrawLine(pen, start, pt);
                start = pt;
            }
        }

        private void DrawText(Point point, string text)
        {
            G.DrawString(text, new Font(fontFamily, fontsize, FontStyle.Regular), Brushes.SteelBlue, point);
        }

        private int GetTextHeight(string text)
        {
            return (int)G.MeasureString(text, new Font(fontFamily, (int)fontsize, FontStyle.Regular)).Height;
            //return (int)GetFormattedText(text).Height;
        }

        private int GetTextLength(string text)
        {
            return (int)G.MeasureString(text, new Font(fontFamily, (int)fontsize, FontStyle.Regular)).Width;
            //return (int)GetFormattedText(text).Width;
        }

        private IEnumerable<Point> GetBezierPoints(Point A, Point B, Point C, Point D)
        {
            List<Point> points = new List<Point>();

            for (double t = 0.0d; t <= 1.0; t += 1.0 / 500)
            {
                double tbs = Math.Pow(t, 2);
                double tbc = Math.Pow(t, 3);
                double tas = Math.Pow((1 - t), 2);
                double tac = Math.Pow((1 - t), 3);

                points.Add(new Point
                {
                    X = (int)(+tac * A.X
                        + 3 * t * tas * B.X
                        + 3 * tbs * (1 - t) * C.X
                        + tbc * D.X),
                    Y = (int)(+tac * A.Y
                        + 3 * t * tas * B.Y
                        + 3 * tbs * (1 - t) * C.Y
                        + tbc * D.Y)
                });
            }

            return points;
        }

        #endregion
    }
}
