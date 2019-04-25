using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;

namespace XmlSample
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        HotelsModels.HotelDbContext context = new HotelsModels.HotelDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string filename in Directory.GetFiles(Server.MapPath("~/App_Data"), "*.xml"))
            {
                string status = "Валиден XML файл <br /> <hr />Успешно прехвърлен в БД";
                Boolean success = true;

                try
                {
                    // Подготовка за валидация чрез XSD
                    // Oxygen XML Editor може да генерира XSD от DTD
                    // Меню Tools > Generate/Convert Schema...
                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.ValidationType = ValidationType.Schema;
                    settings.ValidationFlags = settings.ValidationFlags | XmlSchemaValidationFlags.ReportValidationWarnings;
                    settings.DtdProcessing = DtdProcessing.Ignore;

                    // Зареждане на файла и валидиране
                    XmlReader reader = XmlReader.Create(filename, settings);
                    XmlDocument doc = new XmlDocument();
                    doc.Load(reader);
                    doc.Schemas.Add(null, Server.MapPath("~/App_Data/hotel.xsd"));
                    doc.Validate(null);

                    // Преобразуване от обекти на XML в обекти на модела и проверка дали вече съществуват в БД
                    XmlToDb(doc);
                }



                catch (DbEntityValidationException exception)
                {
                    foreach (var eve in exception.EntityValidationErrors)
                    {
                        status = status + eve.Entry.Entity.GetType().Name + eve.Entry.State + "\n";
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                            status = status + "- Property: \"" + ve.PropertyName + " Error: \"{1}\"" + ve.ErrorMessage + "\n";
                        }
                    }
                }



                 catch (Exception ex)
                {
                    status = "Невалиден XML файл <br /> <hr />Грешка при прехвърлянето: " + ex.Message;
                    success = false;
                 }

                // Добавяне на ред в таблицата на състоянията на прехвърлянето
                TableRow fileRow = new TableRow();
                fileRow.Cells.Add(new TableCell() { Text = Path.GetFileName(filename) });
                fileRow.Cells.Add(new TableCell() { Text = "" + status, ForeColor = success ? Color.Green : Color.Red });
                ImportStatusTable.Rows.Add(fileRow);
            }

            HotelsGridView.DataBind();////////////////
        }

        private void XmlToDb(XmlNode xmlDocument)
        {
            using (var isolatedContext = new HotelsModels.HotelDbContext())
            {
                var hotelXml = xmlDocument.SelectSingleNode("Hotel");

                var hotel = new HotelsModels.Hotel();
                hotel.id = hotelXml.Attributes["id"].InnerText;
                hotel.name = hotelXml.Attributes["name"].InnerText;
                hotel.category = hotelXml.Attributes["category"].InnerText;
/*
               if (isolatedContext.Hotels.Count(bs => bs.id == hotel.id) != 0)
               {
                    throw new Exception("тoзи хотел (ID " + hotel.id + ") вече е в БД");
               }  */

                hotel.website = hotelXml.SelectSingleNode("website").InnerText;
                hotel.description = hotelXml.SelectSingleNode("description").InnerText;
                hotel.facilities = hotelXml.SelectSingleNode("facilities").InnerText;

                foreach (XmlNode premiseXml in hotelXml.SelectNodes("premises/premise"))
                {
                    var premise = new HotelsModels.Premise();
                    premise.premise_id = premiseXml.Attributes["premise_id"].InnerText;
                    premise.type = premiseXml.SelectSingleNode("type").InnerText;

                    var priceXml = premiseXml.SelectSingleNode("price");
                    premise.price = Decimal.Parse(priceXml.InnerText, CultureInfo.InvariantCulture);
                    premise.currency = priceXml.Attributes["currency"].InnerText;

                    premise.furniture = premiseXml.SelectSingleNode("furniture").InnerText;
                    
                    
                    hotel.Premises.Add(premise);
                }

                foreach (XmlNode offerXml in hotelXml.SelectNodes("offers/offer"))
                {
                    var offer = new HotelsModels.Offer();
                    offer.offer_id = offerXml.Attributes["offer_id"].InnerText;
                    offer.type_offer = offerXml.SelectSingleNode("type_offer").InnerText;
                   

                    if (offerXml.SelectSingleNode("descr_offer") != null)
                    {
                        offer.descr_offer = offerXml.SelectSingleNode("descr_offer").InnerText;
                    }

                    var regPriceXml = offerXml.SelectSingleNode("regular_price");
                    offer.regular_price = Decimal.Parse(regPriceXml.InnerText, CultureInfo.InvariantCulture);
                    offer.currency_regular = regPriceXml.Attributes["currency_regular"].InnerText;

                    var promoPriceXml = offerXml.SelectSingleNode("promotional_price");
                    offer.promotional_price = Decimal.Parse(promoPriceXml.InnerText, CultureInfo.InvariantCulture);
                    offer.currency_promotional = promoPriceXml.Attributes["currency_promotional"].InnerText;
                    hotel.Offers.Add(offer);
                }

                foreach (XmlNode employeeXml in hotelXml.SelectNodes("employees/employee"))
                {
                    var employee = new HotelsModels.Employee();
                    employee.employee_id = employeeXml.Attributes["employee_id"].InnerText;
                    employee.first_name = employeeXml.SelectSingleNode("first_name").InnerText;
                    employee.last_name = employeeXml.SelectSingleNode("last_name").InnerText;
                    employee.position = employeeXml.SelectSingleNode("position").InnerText;
              

                    var salaryXml = employeeXml.SelectSingleNode("salary");
                    employee.salary = Decimal.Parse(salaryXml.InnerText, CultureInfo.InvariantCulture);
                    employee.salary_currency = salaryXml.Attributes["salary_currency"].InnerText;

                    employee.gender = employeeXml.Attributes["gender"].InnerText;

                    if (employeeXml.SelectSingleNode("birth_date") != null)
                    {
                        employee.birth_date = employeeXml.SelectSingleNode("birth_date").InnerText;
                    }
                    hotel.Employees.Add(employee);
                }


                foreach (XmlNode reviewXml in hotelXml.SelectNodes("reviews/review"))
                {
                    var review = new HotelsModels.Review();
                    review.review_id = reviewXml.Attributes["review_id"].InnerText;
                    review.reviewer = reviewXml.SelectSingleNode("reviewer").InnerText;
                    review.rating = reviewXml.Attributes["rating"].InnerText;

                    if (reviewXml.SelectSingleNode("comment") != null)
                    {
                        review.comment = reviewXml.SelectSingleNode("comment").InnerText;
                    }


                    hotel.Reviews.Add(review);
                }
              
                isolatedContext.Hotels.Add(hotel);

                // Записване на всички промени
                isolatedContext.SaveChanges();
            }
        }

        public IQueryable<HotelsModels.Hotel> HotelsGridView_GetData()
        {
            return context.Hotels;
        }
    }
}