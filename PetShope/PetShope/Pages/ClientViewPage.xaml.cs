using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PetShope.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClientViewPage.xaml
    /// </summary>
    public partial class ClientViewPage : Page
    {
        public ClientViewPage()
        {
            InitializeComponent(); 
            Init();
        }

        private void Init()
        {

        }

        List<Data.Product> _currentProduct = Data.TradeEntities1.GetContext().Product.ToList();


        private void UpDate()
        {
            UpDate();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpDate();
        }

        private void SortUpRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            UpDate();
        }

        private void SortDownRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            UpDate();
        }

        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpDate();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack) 
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
