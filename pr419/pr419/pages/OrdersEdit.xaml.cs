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
    /// Логика взаимодействия для OrdersEdit.xaml
    /// </summary>
    public partial class OrdersEdit : Window
    {

        Random random;
        Заказы заказы;
        public OrdersEdit()
        {
            InitializeComponent();
            
            заказы = new Заказы();

            DataContext = заказы;

            date_order.DisplayDateStart = DateTime.Now;
            place_order.ItemsSource = Instance.getContext().ПунктыВыдачи.ToList();
        }

        private void save_btn_Click(object sender, RoutedEventArgs e)
        {
            if(date_order.SelectedDate == null)
            {
                MessageBox.Show("Выберите дату");
                return;
            }
            if (place_order.SelectedItem == null)
            {
                MessageBox.Show("Выберите пункт выдачи");
                return;
            }

            
            заказы.Дата_заказа = DateTime.Now;
            заказы.Дата_доставки = (DateTime)date_order.SelectedDate;
            заказы.Код_для_получения = random.Next(100, 999);
            заказы.Статус_заказа = 0;
            заказы.Пункт_выдачи = (place_order.SelectedItem as ПунктыВыдачи).ид;
            if (Data.пользователь != null) заказы.Клиент = Data.пользователь.ид;

            Instance.getContext().Заказы.Add(заказы);
            Instance.getContext().SaveChanges();

            int order_id = Instance.getContext().Заказы.Select(u=>u.ид).Last();

            foreach (var item in Order.orders)
            {
                ПродукцияЗаказа продукцияЗаказа = new ПродукцияЗаказа();
                продукцияЗаказа.ид_продукта = item.Артикул;
                продукцияЗаказа.ид_заказа = order_id;
                продукцияЗаказа.количество = 1;
                Instance.getContext().ПродукцияЗаказа.Add(продукцияЗаказа);
                Instance.getContext().SaveChanges();
            }

            MessageBox.Show("Ваш заказ успешно записан");
            DialogResult = true;
        }
    }
}
