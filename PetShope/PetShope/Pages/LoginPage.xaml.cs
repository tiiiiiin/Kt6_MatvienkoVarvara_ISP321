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

        private async void LoginButton_Click(object sender, RoutedEventArgs e)
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
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }
                if (failedAttemps > 0)
                {
                    if (string.IsNullOrEmpty(CaptchaWriteBox.Text)) 
                    { 
                        MessageBox.Show("Введите капчу!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        LoadCapthca();
                        return;
                    }
                    if (!CaptchaWriteBox.Text.Equals(CaptchaBox.Text, StringComparison.Ordinal))
                    {
                        MessageBox.Show("Неправильная капча!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                        LoadCapthca();
                        CaptchaWriteBox.Text = "";
                        return;
                    }
                }

                if (Data.TradeEntities1.GetContext().User.Any(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == PasswordBox.Password))
                {
                    var user = Data.TradeEntities1.GetContext().User.Where(d => d.UserLogin == LoginTextBox.Text && d.UserPassword == PasswordBox.Password).FirstOrDefault();
                    Classes.Manager.CurrentUser = user;
                    switch (user.Role.RoleName)
                    {
                        case "Администратор":
                            Classes.Manager.MainFrame.Navigate(new Pages.AdminViewPage());
                            break;
                        case "Клиент":
                            Classes.Manager.MainFrame.Navigate(new Pages.ClientViewPage());
                            break;
                        case "Менеджер":
                            Classes.Manager.MainFrame.Navigate(new Pages.ManagerViewPage());
                            break;
                    }
                    MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information); 
                }
                else
                {
                    MessageBox.Show("Учетная запись не найдена", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    failedAttemps++;
                    LoadCapthca();
                    FieldsCaptcha();
                    if (failedAttemps > 1)
                    {
                        LoginButton.IsEnabled = false;
                        await Task.Delay(10000);
                        LoginButton.IsEnabled = true;
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
            string AllowChars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
            string captcha = "";
            Random random = new Random();
            for(int i =0; i <4; i++)
            {
                captcha += AllowChars[random.Next(AllowChars.Length)];
            }
            CaptchaBox.Text = captcha;
        }
        private void FieldsCaptcha()
        {
            CaptchaLabel.Visibility = Visibility.Visible;
            CaptchaBox.Visibility = Visibility.Visible;
            CaptchaWriteBox.Visibility = Visibility.Visible;
        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewProductPage());
        }
    }
}
