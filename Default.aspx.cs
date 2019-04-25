using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XmlSample.HotelsModels;

namespace XmlSample
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          using (HotelDbContext context = new HotelDbContext())
          {
                //context.Hotels.Add(new Hotel());
               // context.SaveChanges();
          }

        }
    }
}