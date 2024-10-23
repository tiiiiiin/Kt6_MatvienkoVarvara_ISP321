using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.IO;

namespace PetShope.Classes
{
    class Manager
    {
        public static Data.User CurrentUser { get; set; }
        public static Frame MainFrame { get; set; }

        public static void GetImageDate()
        {
            try
            {
                var list = Data.TradeEntities1.GetContext().Product.ToList();
                foreach (var item in list)
                {
                    string path = Directory.GetCurrentDirectory() + @"\img\" + item.NamePhoto;
                    if (File.Exists(path))
                    {
                        item.ProductPhoto = File.ReadAllBytes(path);
                    }
                }
                Data.TradeEntities1.GetContext().SaveChanges();
            }
            catch (Exception ex) 
            { 

            }
        }
    }
}
