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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        private int failedAttemps = 0;
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("заполните логин");
                }
                if (string.IsNullOrEmpty(PasswordBox.Password))
                {
                    errors.AppendLine("заполните пароль");
                }
                if(errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                if (failedAttemps > 0)
                {
                    if (string.IsNullOrEmpty(CaptchaWriteBox.Text)) 
                    { 
                        MessageBox.Show("", "", MessageBoxButton.OK, MessageBoxImage.Error);
                        LoadCapthca();
                        return;
                    }
                    if (!CaptchaWriteBox.Text.Equals(CaptchaBox.Text, StringComparison.Ordinal))
                    {
                        MessageBox.Show("", "", MessageBoxButton.OK, MessageBoxImage.Error);
                        LoadCapthca();
                        return;
                    }
                }

                if (Data.TradeEntities1.GetContext().User.Any(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == PasswordBox.Password))
                {
                    var user = Data.TradeEntities1.GetContext().User.Where(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == PasswordBox.Password);
                    Classes.Manager.CurrentUser = user;
                    switch (user.Role.RoleName)
                    {
                        case "":
                            Classes.Manager.MainFrame.Navigate(new Pages.ViewProductPage());
                            break;
                        case "f":
                            Classes.Manager.MainFrame.Navigate(new Pages.ViewProductPage());
                            break;
                        case "d":
                            Classes.Manager.MainFrame.Navigate(new Pages.ViewProductPage());
                            break;
                    }


                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString(), "", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        private void LoadCapthca()
        {

        }
        private void FieldsCaptcha()
        {

        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewProductPage());
        }
    }
}
