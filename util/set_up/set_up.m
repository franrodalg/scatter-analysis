fprintf('\n**********\n');
fprintf('STARTING SET UP');
fprintf('\n**********\n');

%% Definitions

set_constants;

%% Execution options

fprintf('\n**********\n');
fprintf('Reading execution options');
fprintf('\n**********\n');

set_options;
check_options;

%% Paths

fprintf('\n**********\n');
fprintf('Checking folder paths');
fprintf('\n**********\n');

set_paths;
check_paths;
add_paths;

%%

fprintf('\n**********\n');
fprintf('Defining execution order');
fprintf('\n**********\n');

experiments = define_execution(...
    interventions, conditions, feat_sets);


%%

fprintf('\n**********\n');
fprintf('FINISHING SET UP');
fprintf('\n**********\n');