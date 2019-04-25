using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace XmlSample
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        HotelsModels.HotelDbContext context = new HotelsModels.HotelDbContext();
        List<HotelsModels.Premise> premises;
        List<HotelsModels.Offer> offers;
        List<HotelsModels.Employee> employees;
        List<HotelsModels.Review> reviews;

        protected void Page_Load(object sender, EventArgs e)
        {
            premises = ViewState["premises"] as List<HotelsModels.Premise>;
            if (premises == null)
            {
                premises = new List<HotelsModels.Premise>();
                ViewState["premises"] = premises;
            }

            offers = ViewState["offers"] as List<HotelsModels.Offer>;
            if (offers == null)
            {
                offers = new List<HotelsModels.Offer>();
                ViewState["offers"] = offers;
            }

            employees = ViewState["employees"] as List<HotelsModels.Employee>;
            if (employees == null)
            {
                employees = new List<HotelsModels.Employee>();
                ViewState["employees"] = employees;
            }

            reviews = ViewState["reviews"] as List<HotelsModels.Review>;
            if (reviews == null)
            {
                reviews = new List<HotelsModels.Review>();
                ViewState["reviews"] = reviews;
            }
        }

        protected void ValidateHotelID(object source, ServerValidateEventArgs args)
        {
            string hotelID = args.Value;
            if (Regex.IsMatch(hotelID, @"^\w+\-?\w*$"))
            {
                if (context.Hotels.Count(bs => bs.id == hotelID) == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = false;
            }

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression


        public IQueryable<XmlSample.HotelsModels.Premise> PremisesListView_GetData()
        {
            return premises.AsQueryable();
        }

        public IQueryable<XmlSample.HotelsModels.Offer> OffersListView_GetData()
        {
            return offers.AsQueryable();
        }
        public IQueryable<XmlSample.HotelsModels.Employee> EmployeesListView_GetData()
        {
            return employees.AsQueryable();
        }
       public IQueryable<XmlSample.HotelsModels.Review> ReviewsListView_GetData()
       {
           return reviews.AsQueryable();
       }

        public void PremisesListView_InsertItem()
        {
            var item = new XmlSample.HotelsModels.Premise(); 
            TryUpdateModel(item);

            if (premises.Count(b => b.premise_id == item.premise_id) != 0 || context.Premises.Count(b => b.premise_id == item.premise_id) != 0)
            {
                ModelState.AddModelError("premise_id", "Зададеното ID вече се използва за друго помещение");
            }

            if (ModelState.IsValid)
            {
                premises.Add(item);
            }
        }

        public void OffersListView_InsertItem()
        {
            var item = new XmlSample.HotelsModels.Offer();
            TryUpdateModel(item);
            if (offers.Count(b => b.offer_id == item.offer_id) != 0 || context.Offers.Count(b => b.offer_id == item.offer_id) != 0)
            {
                ModelState.AddModelError("offer_id", "Зададеното ID вече се използва");
            }
                offers.Add(item);
        }

        public void EmployeesListView_InsertItem()
        {
            var item = new XmlSample.HotelsModels.Employee();
            TryUpdateModel(item);

            if (employees.Count(b => b.employee_id == item.employee_id) != 0 || context.Offers.Count(b => b.offer_id == item.employee_id) != 0)
            {
                ModelState.AddModelError("offer_id", "Зададеното ID вече се използва");
            }

            if (ModelState.IsValid)
            {
                employees.Add(item);
            }
        }


        public void ReviewsListView_InsertItem()
        {
            var item = new XmlSample.HotelsModels.Review();
            TryUpdateModel(item);
            if (reviews.Count(b => b.review_id == item.review_id) != 0 || context.Offers.Count(b => b.offer_id == item.review_id) != 0)
            {
                ModelState.AddModelError("offer_id", "Зададеното ID вече се използва за друго помещение");
            }

            if (ModelState.IsValid)
            {
                reviews.Add(item);
            }
        }



        // The id parameter name should match the DataKeyNames value set on the control
     /*   public void PremisesListView_DeleteItem(string Id)
        {
            premises.Remove(premises.Single(b => b.premise_id == Id));
        }

        public void EmployeesListView_DeleteItem(string Id)
        {
            employees.Remove(employees.Single(b => b.employee_id == Id));
        }

        public void ReviewsListView_DeleteItem(string Id)
        {
            reviews.Remove(reviews.Single(b => b.review_id == Id));
        }

        public void OffersListView_DeleteItem(string Id)
        {
            offers.Remove(offers.Single(b => b.offer_id == Id));
        }
        */



        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // До срещане на грешка се предполага, че всичко е наред.
            DbStatusLabel.Text = "Успешно записване в БД.";
            DbStatusLabel.ForeColor = Color.Green;

            XmlStatusLabel.Text = "Успешно записване в XML файл.";
            XmlStatusLabel.ForeColor = Color.Green;

            HotelsModels.Hotel hotel = null;

            try
            {
                hotel = ControlsToModel();
                context.Hotels.Add(hotel);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                DbStatusLabel.Text = "Грешка при записване в БД: " + ex.Message;
                DbStatusLabel.ForeColor = Color.Red;
                hotel = null;
            }

            try
            {
                if (hotel == null)
                {
                    throw new Exception("Не се записва XML файл при грешка в записването в БД");
                }
                XDocument hotelXml = ModelToXml(hotel);
                hotelXml.Save(Server.MapPath("~/App_Data/" + hotel.name + hotel.id + ".xml"));
            }
            catch (Exception ex)
            {
                XmlStatusLabel.Text = "Грешка при записване в XML файл: " + ex.Message;
                XmlStatusLabel.ForeColor = Color.Red;

                hotel = null;
            }

            if (hotel != null)
            {
                // При успешно записване се изчистват всички данни в контролите
                foreach (Control control in Master.FindControl("ContentPlaceHolder1").Controls)
                {
                    if (control is TextBox)
                    {
                        (control as TextBox).Text = "";
                    }
                }

                // Изчистване на запазените списъци в ViewState и обновяване на ListView
                premises = new List<HotelsModels.Premise>();
                ViewState["premises"] = premises;
                PremisesListView.DataBind();


                offers = new List<HotelsModels.Offer>();
                ViewState["offers"] = offers;
                OffersListView.DataBind();

                employees = new List<HotelsModels.Employee>();
                ViewState["employees"] = employees;
                EmployeesListView.DataBind();

                reviews = new List<HotelsModels.Review>();
                ViewState["reviews"] = reviews;
                ReviewsListView.DataBind();
            }
        }


        private HotelsModels.Hotel ControlsToModel()
        {
            var hotel = new HotelsModels.Hotel();

            hotel.id = InpHotelID.Text;
            hotel.name = InpHotelName.Text;
            hotel.category = InpCategory.Text;
            hotel.website = InpWebsite.Text;
            hotel.description = InpDescription.Text;
            // bookstore.Notes = String.IsNullOrWhiteSpace(InpNote.Text) ? null : InpNote.Text;
            hotel.facilities = InpFacilities.Text;


            foreach (var enteredPremise in premises)
            {
                var premise = new HotelsModels.Premise()
                {
                    premise_id = enteredPremise.premise_id,
                    type = enteredPremise.type,
                    price = enteredPremise.price,
                    currency = enteredPremise.currency,
                    furniture = enteredPremise.furniture
                };
                hotel.Premises.Add(premise);
            }

            foreach (var enteredOffer in offers)
            {
                // bookID от запазените books не трябва да се използва, затова полетата се копират едно по едно
                var offer = new HotelsModels.Offer()
                {
                    offer_id = enteredOffer.offer_id,
                    type_offer = enteredOffer.type_offer,
                    descr_offer = enteredOffer.descr_offer,
                    regular_price = enteredOffer.regular_price,
                    currency_regular = enteredOffer.currency_regular,
                    promotional_price = enteredOffer.promotional_price,
                    currency_promotional = enteredOffer.currency_promotional

                };
                hotel.Offers.Add(offer);
            }

            foreach (var enteredEmployee in employees)
            {
                // bookID от запазените books не трябва да се използва, затова полетата се копират едно по едно
                var employee = new HotelsModels.Employee()
                {
                    employee_id = enteredEmployee.employee_id,
                    first_name = enteredEmployee.first_name,
                    last_name = enteredEmployee.last_name,
                    position = enteredEmployee.position,
                    salary = enteredEmployee.salary,
                    salary_currency = enteredEmployee.salary_currency,
                    gender = enteredEmployee.gender,
                    birth_date = enteredEmployee.birth_date
                };
                hotel.Employees.Add(employee);
            }

            foreach (var enteredReviews in reviews)
            {
                // bookID от запазените books не трябва да се използва, затова полетата се копират едно по едно
                var review = new HotelsModels.Review()
                {
                    review_id = enteredReviews.review_id,
                    reviewer = enteredReviews.reviewer,
                    rating = enteredReviews.rating,
                    comment = enteredReviews.comment
                };
                hotel.Reviews.Add(review);
            }
            return hotel;
        }

        private XDocument ModelToXml(HotelsModels.Hotel hotel)
        {
            var doc = new XDocument(new XDocumentType("Hotel", null, "hotel.dtd", null));

            XElement root = new XElement("Hotel");
            root.SetAttributeValue("id", hotel.id);
            root.SetAttributeValue("name", hotel.name);
            root.SetAttributeValue("category", hotel.category);

            root.Add(new XElement("website", hotel.website));
            root.Add(new XElement("description", hotel.description));
            root.Add(new XElement("facilities", hotel.facilities));

            root.Add(new XElement("employees"));
            XElement elem = root.Element("employees");
            XElement employee = null;
            foreach (var item in hotel.Employees)
            {
                employee = new XElement("employee");
                employee.SetAttributeValue("employee_id", item.employee_id);
                employee.SetAttributeValue("gender", item.gender);
                employee.Add(new XElement("first_name", item.first_name));
                employee.Add(new XElement("last_name", item.last_name));
                employee.Add(new XElement("position", item.position));
                employee.Add(new XElement("salary", item.salary));
                employee.Element("salary")
                    .SetAttributeValue("salary_currency", item.salary_currency);
                if (item.birth_date != null)
                    employee.Add(new XElement("birth_date", item.birth_date));
                elem.Add(employee);

            }

            root.Add(new XElement("premises"));
            elem = root.Element("premises");
            XElement premise = null;
            foreach (var item in hotel.Premises)
            {
                premise = new XElement("premise");
                premise.SetAttributeValue("premise_id", item.premise_id);
                premise.Add(new XElement("type", item.type));
                premise.Add(new XElement("price", item.price));
                premise.Element("price")
                    .SetAttributeValue("currency", item.currency);
                premise.Add(new XElement("furniture", item.furniture));
                elem.Add(premise);

            }

            root.Add(new XElement("offers"));
            elem = root.Element("offers");
            XElement offer = null;
            foreach (var item in hotel.Offers)
            {
                offer = new XElement("offer");
                offer.SetAttributeValue("offer_id", item.offer_id);
                offer.Add(new XElement("type_offer", item.type_offer));
                if (item.descr_offer != null)
                    offer.Add(new XElement("descr_offer", item.descr_offer));

                offer.Add(new XElement("regular_price", item.regular_price));
                offer.Element("regular_price")
                  .SetAttributeValue("currency_regular", item.currency_regular);
                offer.Add(new XElement("promotional_price", item.promotional_price));
                offer.Element("promotional_price")
                  .SetAttributeValue("currency_promotional", item.currency_promotional);
                elem.Add(offer);

            }

            root.Add(new XElement("reviews"));
            elem = root.Element("reviews");
            XElement review = null;
            foreach (var item in hotel.Reviews)
            {
                review = new XElement("review");
                review.SetAttributeValue("review_id", item.review_id);
                review.Add(new XElement("reviewer", item.reviewer));
                review.SetAttributeValue("rating", item.rating);
                if (item.comment != null)
                    review.Add(new XElement("comment", item.comment));
                elem.Add(review);
            }
            doc.Add(root);

            return doc;
        }


    }
}


