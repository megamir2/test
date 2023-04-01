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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace pr419.pages
{
    /// <summary>
    /// Логика взаимодействия для OrdersFrame.xaml
    /// </summary>
    public partial class OrdersFrame : Page
    {
        public OrdersFrame()
        {
            InitializeComponent();
            Data.page_title.Text = "Корзина";
            LoadPage();
        }

        private void save_order_Click(object sender, RoutedEventArgs e)
        {
            OrdersEdit ordersEdit = new OrdersEdit();
            if(ordersEdit.ShowDialog() == true)
            {

            }
        }

        private void delete_element_order_Click(object sender, RoutedEventArgs e)
        {
            var item = OrderList.SelectedItem as Продукция;
            if (item != null)
            {
                Order.orders.Remove(item);
                LoadPage();
            }
        }

        private void LoadPage()
        {
            OrderList.ItemsSource = Order.orders.ToList();
        }
    }
}
