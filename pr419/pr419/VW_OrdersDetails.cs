//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pr419
{
    using System;
    using System.Collections.Generic;
    
    public partial class VW_OrdersDetails
    {
        public int ид { get; set; }
        public Nullable<int> Стоимость { get; set; }
        public System.DateTime Дата_заказа { get; set; }
        public System.DateTime Дата_доставки { get; set; }
        public int Пункт_выдачи { get; set; }
        public Nullable<int> Клиент { get; set; }
        public int Статус_заказа { get; set; }
        public int Код_для_получения { get; set; }
        public Nullable<int> Терминал { get; set; }
        public Nullable<int> СтоимостьЗаказа { get; set; }
    }
}