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
    /// Логика взаимодействия для ViewProductPage.xaml
    /// </summary>
    public partial class ViewProductPage : Page
    {
        public ViewProductPage()
        {
            InitializeComponent();
            Init();
        }

        public void Init()
        {
            ProductListView.ItemsSource = Data.TradeEntities1.GetContext().Product.ToList();
            CountOfLabel.Content = $"{Data.TradeEntities1.GetContext().Product.Count()}" + $"/{Data.TradeEntities1.GetContext().Product.Count()}";
            if(Classes.Manager.CurrentUser != null)
            {
                FIOLabel.Content = $"{Classes.Manager.CurrentUser.UserSurname} " 
                    + $" {Classes.Manager.CurrentUser.UserName}" 
                    + $" {Classes.Manager.CurrentUser.UserPatronymic}";
            }
            SearchTextBox.Text = string.Empty;
            SortUpRadioButton.IsChecked = false;
            SortDownRadioButton.IsChecked = false;


            var manufactlist = Data.TradeEntities1.GetContext().ManufacturerProduct.ToList();
            manufactlist.Insert(0, new Data.ManufacturerProduct { Name = "Все производители" });
            ManufacturerComboBox.SelectedIndex = 0;
            ManufacturerComboBox.ItemsSource = manufactlist;
        }

        public List<Data.Product> _currentProduct = Data.TradeEntities1.GetContext().Product.ToList();

        public void UpDate()
        {
           
            //_currentProduct = Data.TradeEntities1.GetContext().Product.ToList();
            //_currentProduct = (from item )
           
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
