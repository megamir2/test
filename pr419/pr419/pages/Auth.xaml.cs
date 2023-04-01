using pr419.classes;
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
using System.Windows.Shapes;

namespace pr419.pages
{
    /// <summary>
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Window
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(login_field.Text == "" && password_field.Password == "")
            {
                MessageBox.Show("Заполните все поля");
                return;
            }

            var user = Instance.getContext().Пользователи.Where(u=>u.Password == password_field.Password.ToString() && u.Login == login_field.Text.ToString()).FirstOrDefault();

            if(user != null) 
            {
                Data.пользователь = user;
                MainWindow main = new MainWindow();
                main.Show();
                Close();
            } else
            {
                MessageBox.Show("Доступа нет");
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            Close();
        }
    }
}
