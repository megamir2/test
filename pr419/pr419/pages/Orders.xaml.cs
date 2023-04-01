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
    /// Логика взаимодействия для Orders.xaml
    /// </summary>
    public partial class Orders : Page
    {
        public Orders()
        {
            InitializeComponent();

            LoadPage();
        }

        private void menu_btn_edit_order_Click(object sender, RoutedEventArgs e)
        {

        }

        private void menu_btn_delete_order_Click(object sender, RoutedEventArgs e)
        {
            var item = orders_list.SelectedItem as VW_OrdersDetails;
            if(item != null)
            {
                var ProductsOfOrder = Instance.getContext().ПродукцияЗаказа.Where(u => u.ид_заказа == item.ид);
                Instance.getContext().ПродукцияЗаказа.RemoveRange(ProductsOfOrder);
                Instance.getContext().Заказы.Remove(Instance.getContext().Заказы.Where(u=>u.ид == item.ид).FirstOrDefault());
                Instance.getContext().SaveChanges();
                LoadPage();
            }
        }

        private void LoadPage()
        {
            orders_list.ItemsSource = Instance.getContext().VW_OrdersDetails.ToList();
        }

        
    }
}
