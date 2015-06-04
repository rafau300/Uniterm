using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Media;
using System.Drawing;
using System.Drawing.Imaging;
using System.Data;


namespace Uniterm_ASP
{
    public class UnitermImage : IHttpHandler
    {
        MyDrawing md = new MyDrawing();
        DataBase db;
        public void ProcessRequest(HttpContext context)
        {
            db = new DataBase();

            string name = context.Request.QueryString["name"];
            if (name != "" && name != null)
            {
                DataRow dr = db.CreateDataRow(String.Format("select * from uniterms where name = '{0}';", name));

                MyDrawing.eA = (string)dr["eA"];
                MyDrawing.eB = (string)dr["eB"];
                MyDrawing.eC = (string)dr["eC"];

                MyDrawing.sA = (string)dr["sA"];
                MyDrawing.sB = (string)dr["sB"];
                MyDrawing.sOp = (string)dr["sOp"];

                MyDrawing.fontFamily = new FontFamily((string)dr["fontFamily"]);
                MyDrawing.fontsize = (Int16)dr["fontSize"];
                MyDrawing.oper = ((string)dr["switched"])[0]; ;
            }


            md.Redraw();
            context.Response.ContentType = "image/jpeg";
            md.UnitermBitmap.Save(context.Response.OutputStream, ImageFormat.Jpeg);

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
