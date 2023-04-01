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
    /// Логика взаимодействия для ProductsFrame.xaml
    /// </summary>
    public partial class ProductsFrame : Page
    {
        int page_count = 0;
        int actual_page = 0;
        int count_items_on_page = 10;

        List<Продукция> продукция;

        public ProductsFrame()
        {
            InitializeComponent();
            loadPage();

            Data.page_title.Text = "Продукция";
        }

        private void prev_page_btn_Click(object sender, RoutedEventArgs e)
        {
            if (actual_page > 0)
            {
                actual_page--;

                next_page_btn.IsEnabled = true;
                if (actual_page == 0) prev_page_btn.IsEnabled = false;

                loadPage();
            }            
        }

        private void next_page_btn_Click(object sender, RoutedEventArgs e)
        {
            if (actual_page < page_count) 
            { 
                actual_page++;

                prev_page_btn.IsEnabled = true;
                if (actual_page == page_count) next_page_btn.IsEnabled = false;

                loadPage();
            }            
        }

        private void loadPage()
        {
            продукция = Instance.getContext().Продукция.OrderBy(u => u.Артикул).ToList();
            ProductsDataGrid.ItemsSource = ФильтрПродукции();
        }

        private List<Продукция> ФильтрПродукции()
        {
            List<Продукция> прод = продукция;

            if(search_field.Text != "")
                прод = прод.Where(u => u.Наименование.ToLower().Contains(search_field.Text.ToString().ToLower())).ToList();

            if(filter_discont.SelectedIndex != 0 && filter_discont.SelectedIndex != -1)
            {
                switch(filter_discont.SelectedIndex)
                {
                    case 1: прод = прод.Where(u => u.Действующая_скидка > 0 && u.Действующая_скидка < 10).ToList(); break; 
                    case 2: прод = прод.Where(u => u.Действующая_скидка > 10 && u.Действующая_скидка < 15).ToList(); break; 
                    case 3: прод = прод.Where(u => u.Действующая_скидка > 15).ToList(); break;
                }
            }

            page_count = прод.Count() / count_items_on_page;
            if (прод.Count() % count_items_on_page == 0) page_count--;

            count_products.Text = прод.Count() + "/" + продукция.Count();

            return прод.Skip(actual_page * count_items_on_page).Take(count_items_on_page).ToList();
        }

        private void search_field_TextChanged(object sender, TextChangedEventArgs e)
        {
            loadPage();
        }

        private void filter_discont_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(filter_discont.SelectedIndex != -1)
            loadPage();
        }

        private void add_product_to_order_Click(object sender, RoutedEventArgs e)
        {
            var item = ProductsDataGrid.SelectedItem as Продукция;
            Data.open_orders.Visibility = Visibility.Visible;
            Order.orders.Add(item);
        }
    }
}
