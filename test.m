clear; clc;
v1=[100 50 100 50];
v2=[50 100 50 100];
v3=[100 55 100 45];

normalizado=normalizar(v1);
Trans1=abs(fft(v1))
normalizado2=normalizar(v2);
Trans2=abs(fft(v2))
normalizado3=normalizar(v3);
Trans3=abs(fft(normalizado3))

error1=Trans1-Trans2
error2=Trans1-Trans3
%error1= normalizado+((normalizado/100)*10)
%error2= ((v1/100)*10)
%promedio=mean(error2)



%function varargout = tsp_ga(varargin)
%
%error(nargchk(0, 9, nargin));
%num_cities = 10;
%num_dims = 2;
%cities = 10*rand(num_cities, num_dims);
%pop_size = 20;
%num_iter = 50;
%mutate_rate = 0.8;
%show_progress = 0;
%show_results = 1;
%
%% Process Inputs
%cities_flag = 0; 
%option_flag = 0;
%for var = varargin
%    if option_flag
%        if ~isfloat(var{1}), error(['Invalid value for option ' upper(option)]); end
%        switch option
%            case 'popsize', pop_size = 4*ceil(real(var{1}(1))/4); option_flag = 0;
%            case 'mrate', mutate_rate = min(abs(real(var{1}(1))), 1); option_flag = 0;
%            case 'numiter', num_iter = round(real(var{1}(1))); option_flag = 0;
%            otherwise, error(['Invalid option ' upper(option)])
%        end
%    elseif ischar(var{1})
%        switch lower(var{1})
%            case '-noplot', show_progress = 0;
%            case '-results', show_results = 1;
%            otherwise, option = lower(var{1}); option_flag = 1;
%        end
%    elseif isfloat(var{1})
%        if cities_flag, error('CITIES or NUM_CITIES may be specified, but not both'); end
%        if length(var{1}) == 1
%            num_cities = round(real(var{1}));
%            if num_cities < 2, error('NUM_CITIES must be an integer greater than 1'); end
%            cities = 10*rand(num_cities, num_dims); cities_flag = 1;
%        else
%            cities = real(var{1});
%            [num_cities, num_dims] = size(cities); cities_flag = 1;
%            if or(num_cities < 2, num_dims ~= 2)
%                error('CITIES must be an Nx2 matrix of floats, with N > 1')
%            end
%        end
%    else
%        error('Invalid input argument.')
%    end
%end
%
%% Matriz de distancias
%mat3d1 = reshape(cities, 1, num_cities, num_dims);
%mat3d2 = reshape(cities, num_cities, 1, num_dims);
%dist_matx = sqrt(sum((mat3d1(ones(num_cities, 1), :, :) - mat3d2(:, ones(num_cities, 1), :)).^2, 3));
%
%% grafica Ciudades y distancias
%if show_progress
%    pfig = figure;
%    subplot(2, 2, 1)
%    plot(cities(:, 1), cities(:, 2), 'b.')
%    if num_cities < 75
%        for c = 1:num_cities
%            text(cities(c, 1), cities(c, 2), [' ' num2str(c)], 'Color', 'k', 'FontWeight', 'b')
%        end
%    end
%    title([num2str(num_cities) ' Cities'])
%    subplot(2, 2, 2)
%    imagesc(dist_matx)
%    title('Distance Matrix')
%    colormap(flipud(gray))
%end
%
%% Poblacion inicial
%pop = zeros(pop_size, num_cities);
%pop(1, :) = (1:num_cities);
%for k = 2:pop_size
%    pop(k, :) = randperm(num_cities); % permuraciones aleatorias
%end
%
%display_rate = 20;
%
%% fitness
%if num_iter < 50, display_rate = 2; end
%fitness = zeros(1, pop_size);
%best_fitness = zeros(1, num_iter);
%for iter = 1:num_iter
%    for p = 1:pop_size
%        d = dist_matx(pop(p, 1), pop(p, num_cities));
%        for city = 2:num_cities
%            d = d + dist_matx(pop(p, city-1), pop(p, city));
%        end
%        fitness(p) = d;
%    end
%    [best_fitness(iter) index] = min(fitness); % guardar mejor ruta en una matriz 
%    best_route = pop(index, :);  % Mejor ruta
%    
%    % Graficas de la mejor ruta
%    if ~mod(iter, display_rate) && show_progress
%        figure(pfig)
%        subplot(2, 2, 3)
%        route = cities([best_route best_route(1)], :);
%        plot(route(:, 1), route(:, 2)', 'b.-')
%        title(['Best GA Route (dist = ' num2str(best_fitness(iter)) ')'])
%        subplot(2, 2, 4)
%        plot(best_fitness(1:iter), 'r', 'LineWidth', 2)
%        axis([1 max(2, iter) 0 max(best_fitness)*1.1])
%    end
%    
%    % Genetic Algorithm Search
%    pop = genetic_algorithm(pop, fitness, mutate_rate);
%end
%
%if show_progress
%    figure(pfig)
%    subplot(2, 2, 3)
%    route = cities([best_route best_route(1)], :);
%    plot(route(:, 1), route(:, 2)', 'b.-')
%    title(['Best GA Route (dist = ' num2str(best_fitness(iter)) ')'])
%    subplot(2, 2, 4)
%    plot(best_fitness(1:iter), 'r', 'LineWidth', 2)
%    title('Best Fitness')
%    xlabel('Generation')
%    ylabel('Distance')
%    axis([1 max(2, iter) 0 max(best_fitness)*1.1])
%end
%
%if show_results
%    figure(2)
%    imagesc(dist_matx)
%    title('Distance Matrix')
%    colormap(flipud(gray))
%    figure(3)
%    plot(best_fitness(1:iter), 'r', 'LineWidth', 2)
%    title('Best Fitness')
%    xlabel('Generation')
%    ylabel('Distance')
%    axis([1 max(2, iter) 0 max(best_fitness)*1.1])
%    figure(4)
%    route = cities([best_route best_route(1)], :);
%    plot(route(:, 1), route(:, 2)', 'b.-')
%    for c = 1:num_cities
%        text(cities(c, 1), cities(c, 2), [' ' num2str(c)], 'Color', 'k', 'FontWeight', 'b')
%    end
%    title(['Best GA Route (dist = ' num2str(best_fitness(iter)) ')'])
%end
%
%[not_used indx] = min(best_route);
%best_ga_route = [best_route(indx:num_cities) best_route(1:indx-1)];
%if best_ga_route(2) > best_ga_route(num_cities)
%    best_ga_route(2:num_cities) = fliplr(best_ga_route(2:num_cities));
%end
%varargout{1} = cities(best_ga_route, :);
%varargout{2} = best_ga_route;
%varargout{3} = best_fitness(iter);
%
%
%
%
%
%% --- subfunction: genetic algorithm
%function new_pop = genetic_algorithm(pop, fitness, mutate_rate)
%[p, n] = size(pop);
%
%% Seleccion por torneo- Round One
%new_pop = zeros(p, n);
%ts_r1 = randperm(p);
%winners_r1 = zeros(p/2, n);
%tmp_fitness = zeros(1, p/2);
%for k = 2:2:p
%    if fitness(ts_r1(k-1)) > fitness(ts_r1(k))
%        winners_r1(k/2, :) = pop(ts_r1(k), :);
%        tmp_fitness(k/2) = fitness(ts_r1(k));
%    else
%        winners_r1(k/2, :) = pop(ts_r1(k-1), :);
%        tmp_fitness(k/2) = fitness(ts_r1(k-1));
%    end
%end
%
%% Seleccion por torneo - Round Two
%ts_r2 = randperm(p/2);
%winners = zeros(p/4, n);
%for k = 2:2:p/2
%    if tmp_fitness(ts_r2(k-1)) > tmp_fitness(ts_r2(k))
%        winners(k/2, :) = winners_r1(ts_r2(k), :);
%    else
%        winners(k/2, :) = winners_r1(ts_r2(k-1), :);
%    end
%end
%new_pop(1:p/4, :) = winners;
%new_pop(p/2+1:3*p/4, :) = winners;
%
%% Crossover
%crossover = randperm(p/2);
%children = zeros(p/4, n);
%for k = 2:2:p/2
%    parent1 = winners_r1(crossover(k-1), :);
%    child = winners_r1(crossover(k), :);
%    ndx = ceil(n*sort(rand(1, 2)));
%    while ndx(1) == ndx(2)
%        ndx = ceil(n*sort(rand(1, 2)));
%    end
%    tmp = parent1(ndx(1):ndx(2));
%    for kk = 1:length(tmp)
%        child(child == tmp(kk)) = 0;
%    end
%    child = [child(1:ndx(1)) tmp child(ndx(1)+1:n)];
%    child(child == 0) = [];
%    children(k/2, :) = child;
%end
%new_pop(p/4+1:p/2, :) = children;
%new_pop(3*p/4+1:p, :) = children;
%
%% Mutacion
%mutate = randperm(p/2);
%num_mutate = round(mutate_rate*p/2);
%for k = 1:num_mutate
%    ndx = ceil(n*sort(rand(1, 2)));
%    while ndx(1) == ndx(2)
%        ndx = ceil(n*sort(rand(1, 2)));
%    end
%    if rand < 0.75 % swap segment between two cities
%        new_pop(p/2+mutate(k), ndx(1):ndx(2)) = fliplr(new_pop(p/2+mutate(k), ndx(1):ndx(2)));
%    else % swap two cities
%        new_pop(p/2+mutate(k), [ndx(1) ndx(2)]) = new_pop(p/2+mutate(k), [ndx(2) ndx(1)]);
%    end
%end
%
%
%
