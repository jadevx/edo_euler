function euler_solver(fname, x0, y0, h, xn)
  f = str2func(['@(x,y)', fname]);
  x = x0:h:xn;
  y = zeros(size(x));
  y(1) = y0;

  for i = 1:(length(x)-1)
    y(i+1) = y(i) + h * f(x(i), y(i));
  endfor

  % Guardamos los resultados en un archivo CSV
  data = [x' y'];
  csvwrite("resultado.csv", data);
endfunction