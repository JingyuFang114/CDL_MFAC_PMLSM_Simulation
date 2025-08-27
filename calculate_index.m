file1='PMLSM_CDL-MFAC_0708';
file2='PMLSM_FFDL_0708';
file3='PMLSM_PI_0708';

% 读取PMLSM_FFDL_0708.mat文件
data_FFDL = load('PMLSM_FFDL_0708.mat');

% 读取PMLSM_CDL-MFAC_0708.mat文件
data_CDL_MFAC = load('PMLSM_CDL-MFAC_0708.mat');

data_PI = load('PMLSM_PI_0708.mat');

% 获取FFDL中的Simulink.SimulationOutput对象
out_FFDL = data_FFDL.out;

% 获取CDL_MFAC中的Simulink.SimulationOutput对象
out_CDL_MFAC = data_CDL_MFAC.out;

out_PI = data_PI.out;

disp('loaded')

% 读取并添加前缀到FFDL中的变量
FFDL_e = out_FFDL.e;
FFDL_id = out_FFDL.id;
FFDL_iq = out_FFDL.iq;
FFDL_v_m = out_FFDL.v_m;

% 读取并添加前缀到CDL_MFAC中的变量
CDL_MFAC_e = out_CDL_MFAC.e;
CDL_MFAC_id = out_CDL_MFAC.id;
CDL_MFAC_iq = out_CDL_MFAC.iq;
CDL_MFAC_v_m = out_CDL_MFAC.v_m;

% 读取并添加前缀到FFDL中的变量
PI_e = out_PI.e;
PI_id = out_PI.id;
PI_iq = out_PI.iq;
PI_v_m = out_PI.v_m;

% 创建一个新图形窗口
figure;

% 绘制FFDL_e
plot(FFDL_e.time, FFDL_e.signals.values, 'b-', 'DisplayName', 'MFAC_e');
hold on;

% 绘制CDL_MFAC_e
plot(CDL_MFAC_e.time, CDL_MFAC_e.signals.values, 'r--', 'DisplayName', 'CDL-MFAC_e');

% 绘制PI_e
plot(PI_e.time, PI_e.signals.values, 'c-.', 'DisplayName', 'PI_e');

% 添加图例
legend;

% 添加标题和轴标签
%title('Velocity error comparison of MFAC, PI and CDL-MFAC');
xlabel('Time (s)');
ylabel('Error (m/s)');

% 计算IAE_FFDL
dt_ffdl = diff(FFDL_e.time);
abs_e_ffdl = abs(FFDL_e.signals.values(1:end-1));
IAE_FFDL = sum(dt_ffdl .* abs_e_ffdl);
%disp(IAE_FFDL);
% 计算CDL_MFAC_FFDL
dt_cdl_mfac = diff(CDL_MFAC_e.time);
abs_e_cdl_mfac = abs(CDL_MFAC_e.signals.values(1:end-1));
IAE_CDL_MFAC = sum(dt_cdl_mfac .* abs_e_cdl_mfac);
% 计算IAE_PI
dt_pi = diff(PI_e.time);
abs_e_pi = abs(PI_e.signals.values(1:end-1));
IAE_PI = sum(dt_pi .* abs_e_pi);


% 显示图形
hold off;

% 创建figure
figure;

% 绘制FFDL_v_m
plot(FFDL_v_m.Time, FFDL_v_m.Data, 'b-', 'DisplayName', 'MFAC v_m');

% 保持图形
hold on;

% 绘制CDL_MFAC_v_m
plot(CDL_MFAC_v_m.Time, CDL_MFAC_v_m.Data, 'r--', 'DisplayName', 'CDL_MFAC v_m');

plot(PI_v_m.Time, PI_v_m.Data, 'c-.', 'DisplayName', 'PI v_m');

% 添加图例
legend;

% 添加标题和轴标签
%title('Velocity comparison of MFAC, PI and CDL-MFAC');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

% 显示图形
hold off;

% 创建第一张图，包含FFDL_id和FFDL_iq
figure;
subplot(2, 1, 1);
plot(out_FFDL.id.time, out_FFDL.id.signals.values);
%title('MFAC\_id');
xlabel('Time (s)');
ylabel('MFAC\_id (A)');
legend('MFAC\_id');

subplot(2, 1, 2);
plot(out_FFDL.iq.time, out_FFDL.iq.signals.values);
%title('MFAC\_iq');
xlabel('Time (s)');
ylabel('MFAC\_iq (A)');
legend('MFAC\_iq');

% 创建第二张图，包含CDL_MFAC_id和CDL_MFAC_iq
figure;
subplot(2, 1, 1);
plot(out_CDL_MFAC.id.time, out_CDL_MFAC.id.signals.values);
%title('CDL-MFAC\_id');
xlabel('Time (s)');
ylabel('CDL-MFAC\_id (A)');
legend('CDL-MFAC\_id');

subplot(2, 1, 2);
plot(out_CDL_MFAC.iq.time, out_CDL_MFAC.iq.signals.values);
%title('CDL-MFAC\_iq');
xlabel('Time (s)');
ylabel('CDL-MFAC\_iq (A)');
legend('CDL-MFAC\_iq');

% 创建第二张图，包含CDL_MFAC_id和CDL_MFAC_iq
figure;
subplot(2, 1, 1);
plot(out_PI.id.time, out_PI.id.signals.values);
%title('PI\_id');
xlabel('Time (s)');
ylabel('PI\_id (A)');
legend('PI\_id');

subplot(2, 1, 2);
plot(out_PI.iq.time, out_PI.iq.signals.values);
%title('PI\_iq');
xlabel('Time (s)');
ylabel('PI\_iq (A)');
legend('PI\_iq');

% % 计算IAIQ_PI
% dt_pi_q  = diff(out_PI.iq.time);
% abs_iq_pi = abs(out_PI.iq.signals.values(1:end-1));
% IAIQ_PI = sum(dt_pi_q .* abs_iq_pi);
% % 计算IAIQ_FFDL
% dt_ffdl_q = diff(out_FFDL.iq.time);
% abs_iq_ffdl = abs(out_FFDL.iq.signals.values(1:end-1));
% IAIQ_FFDL = sum(dt_ffdl_q .* abs_iq_ffdl);
% % 计算IAIQ_CDL_MFAC
% dt_cdl_mfac_q = diff(out_CDL_MFAC.iq.time);
% abs_iq_cdl_mfac = abs(out_CDL_MFAC.iq.signals.values(1:end-1));
% IAIQ_CDL_MFAC = sum(dt_cdl_mfac_q .* abs_iq_cdl_mfac);
% 
% 
% % 计算IAID_PI
% dt_pi_d = diff(out_PI.id.time);
% abs_id_pi = abs(out_PI.id.signals.values(1:end-1));
% IAID_PI = sum(dt_pi_d .* abs_id_pi);
% % 计算IAID_FFDL
% dt_ffdl_d = diff(out_FFDL.id.time);
% abs_id_ffdl = abs(out_FFDL.id.signals.values(1:end-1));
% IAID_FFDL = sum(dt_ffdl_d .* abs_id_ffdl);
% % 计算IAID_CDL_MFAC
% dt_cdl_mfac_d = diff(out_CDL_MFAC.id.time);
% abs_id_cdl_mfac = abs(out_CDL_MFAC.id.signals.values(1:end-1));
% IAID_CDL_MFAC = sum(dt_cdl_mfac_d .* abs_id_cdl_mfac);


% 计算IAVIQ_PI
dt_pi_q  = diff(out_PI.iq.time);
diq_pi = diff(out_PI.iq.signals.values) ./ dt_pi_q;
abs_diq_pi = abs(diq_pi);
IAVIQ_PI = sum(abs_diq_pi .* dt_pi_q);
% 计算IAVID_PI
dt_pi_d = diff(out_PI.id.time);
did_pi = diff(out_PI.id.signals.values) ./ dt_pi_d;
abs_did_pi = abs(did_pi);
IAVID_PI = sum(abs_did_pi .* dt_pi_d);
% 计算IAVIQ_FFDL
dt_ffdl_q = diff(out_FFDL.iq.time);
diq_ffdl = diff(out_FFDL.iq.signals.values) ./ dt_ffdl_q;
abs_diq_ffdl = abs(diq_ffdl);
IAVIQ_FFDL = sum(abs_diq_ffdl .* dt_ffdl_q);


% 计算IAVID_FFDL
dt_ffdl_d = diff(out_FFDL.id.time);
did_ffdl = diff(out_FFDL.id.signals.values) ./ dt_ffdl_d;
abs_did_ffdl = abs(did_ffdl);
IAVID_FFDL = sum(abs_did_ffdl .* dt_ffdl_d);
% 计算IAVIQ_CDL_MFAC
dt_cdl_mfac_q = diff(out_CDL_MFAC.iq.time);
diq_cdl_mfac = diff(out_CDL_MFAC.iq.signals.values) ./ dt_cdl_mfac_q;
abs_diq_cdl_mfac = abs(diq_cdl_mfac);
IAVIQ_CDL_MFAC = sum(abs_diq_cdl_mfac .* dt_cdl_mfac_q);
% 计算IAVID_CDL_MFAC
dt_cdl_mfac_d = diff(out_CDL_MFAC.id.time);
did_cdl_mfac = diff(out_CDL_MFAC.id.signals.values) ./ dt_cdl_mfac_d;
abs_did_cdl_mfac = abs(did_cdl_mfac);
IAVID_CDL_MFAC = sum(abs_did_cdl_mfac .* dt_cdl_mfac_d);

%% 输出IAE、IAVU、IAVIQ和IAVID值到命令行窗口
% 创建一个表格
%resultsTable = table(IAE_PI, IAE_FFDL, IAE_CDL_MFAC, IAID_PI, IAID_FFDL, IAID_CDL_MFAC, IAIQ_PI, IAIQ_FFDL, IAIQ_CDL_MFAC, IAVID_PI, IAVID_FFDL, IAVID_CDL_MFAC, IAVIQ_PI, IAVIQ_FFDL, IAVIQ_CDL_MFAC, 'VariableNames', {'IAE_PI', 'IAE_FFDL', 'IAE_CDL_MFAC', 'IAID_PI', 'IAID_FFDL', 'IAID_CDL_MFAC', 'IAIQ_PI', 'IAIQ_FFDL', 'IAIQ_CDL_MFAC', 'IAVID_PI', 'IAVID_FFDL', 'IAVID_CDL_MFAC', 'IAVIQ_PI', 'IAVIQ_FFDL', 'IAVIQ_CDL_MFAC'});
resultsTable = table(IAE_PI, IAE_FFDL, IAE_CDL_MFAC, IAVID_PI, IAVID_FFDL, IAVID_CDL_MFAC, IAVIQ_PI, IAVIQ_FFDL, IAVIQ_CDL_MFAC, 'VariableNames', {'IAE_PI', 'IAE_FFDL', 'IAE_CDL_MFAC', 'IAVID_PI', 'IAVID_FFDL', 'IAVID_CDL_MFAC', 'IAVIQ_PI', 'IAVIQ_FFDL', 'IAVIQ_CDL_MFAC'});
% 显示表格
disp(resultsTable);


