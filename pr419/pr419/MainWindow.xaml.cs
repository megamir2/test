using pr419.classes;
using pr419.pages;
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

namespace pr419
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

           

            Data.mainframe = Mainframe;
            Data.open_orders = open_orders;
            Data.page_title = page_title;

            if(Data.пользователь != null)
            {
                username.Text = Data.пользователь.Фамилия + " " + Data.пользователь.Имя + " " + Data.пользователь.отчество;

                if (Data.пользователь.Role == 1 || Data.пользователь.Role == 2)
                {
                    open_orders_list.Visibility = Visibility.Visible;
                }
            }
            else
            {
                username.Visibility = Visibility.Collapsed;
            }

            

            Data.mainframe.Navigate(new ProductsFrame());
        }

        private void open_orders_Click(object sender, RoutedEventArgs e)
        {
            Data.mainframe.Navigate(new OrdersFrame());
        }

        private void open_products_Click(object sender, RoutedEventArgs e)
        {
            Data.mainframe.Navigate(new ProductsFrame());
        }

        private void open_orders_list_Click(object sender, RoutedEventArgs e)
        {
            Data.mainframe.Navigate(new Orders());
        }
    }
}
