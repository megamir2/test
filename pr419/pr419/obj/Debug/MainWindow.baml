   M S B A M L   `   `   `  ����@  <pr419, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:pr419pr419  5   	       pr419.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:pr419     5   	     � 
ResizeMode$  NoResize=�5       � Title$ 
MainWindow��5   	   $	��450��6   $	��800��6)   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��auto �6   �� 5      $��1* �6    � ColumnDefinitions 5   
   �� 5      $��4* �6   �� 5      $��1* �6   .+�5   
   �� $��0��6   $��0��6"   $��Center=�62    �� Orientation$ 
Horizontal=�6M   $��5 5 5 5q�6f   .+�5      �� $��/assets/logo.png��6   $��30��6.   �� 5      -   5        $��
page_title��5   (   $��Продукты��6   $��22(�6:   $��10 0 0 0q�6H   5       � 5   
   -   5          �Name$ 	Mainframe��5        � NavigationUIVisibility$ Hidden=�6#   $��1��6C   ]� 5   
   ��. $��1��6)   $��10,10,10,10q�69   $��2��6N   .+�5      �� -   5         ��Name$ username��5      $��булпап��6*   $��18(�68   $	��Top=�6F   $
��Wrap=�6[   �� 5      $��1��6   $	��Top=�6$   ���#00069   �� 5       $	��Top=�6   $��0 10 0 0q�6.   .+�5!      �� -   5         ��Name$ open_products��5!      $��Продукция��60   6D   �� 5"      -   5        $ open_orders��5"      $��Корзина��6.   $y�	Collapsed=�6@   6W   �� 5#      -   5        $ open_orders_history��5#      $#��История заказов��66   $y�	Collapsed=�6P   �� 5$      -   5        $ open_orders_list��5$      $��Все заказы��63   $y�	Collapsed=�6H   6_   5%      5&      5'      5(      