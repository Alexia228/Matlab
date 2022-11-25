function [out_x, out_y] = find_difference_func(x1, y1, x2, y2)

GRID_LIMIT = 1000000;

left_border_x1 = min (x1);
right_border_x1 = max (x1);

left_border_x2 = min (x2);
right_border_x2 = max (x2);

left_border = max([left_border_x1, left_border_x2]);    %Границы новой сетки
right_border = min([right_border_x1, right_border_x2]); 

diff_step_x1 = diff(x1)
diff_step_x2 = diff(x2);

diff_step = ([diff_step_x1 diff_step_x2]);         % Массив шагов обеих сеток

step = prctile(diff_step, 1);                      % Выбираем оптимальный шаг
dot_count = (right_border - left_border) / step;   % Количество точек для выбранного шага

if dot_count > GRID_LIMIT                          % Если точек дофига, то меняем шаг на разрешённый
step = (right_border - left_border)/GRID_LIMIT;
end
new_grid = left_border : step : right_border;

interpolation_1 = interp1(x1, y1, new_grid);       % Интерполируем обе исходные функции на новую сетку
interpolation_2 = interp1(x2, y2, new_grid);

out_x = new_grid;
out_y = interpolation_2 - interpolation_1;
plot (out_x, out_y);

end







