%%
% Screen('Flip')����Ļ����ֱˢ��ͬ����Ҳ����˵�������е���Screen('Flip')��ʱ�̣������Ļ�ı���ˢ��û�н���
% Filp����ͣ���򣬵ȴ��´�ˢ����Ļ��ʼ���ٻ��ƻ����е�ͼ��
%%
% ������д��ںͱ���
sca;
close all;
clearvars;

% ����ͬ���Լ��
Screen('Preference', 'SkipSyncTests', 1);

% ��⵱ǰ���ڵ��Ե���Ļ������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ����ֻ��һ����Ļ����Ĭ�ϱ��Ϊ0
screens = Screen('Screens');

% ѡ����Ļ
screenNumber = max(screens);

% ��ð�ɫ�ͺ�ɫ����ɫֵ������Ĭ�����Ƿֱ�Ϊ0��255
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% �����ɫ����ɫֵ
grey = white / 2;

% ��һ�����ڣ�����������Ϊ��ɫ�����ش��ھ���ʹ��ڴ�С
[window, windowRect] = Screen('OpenWindow', screenNumber, grey);

% ����ˢ�¼��
ifi = Screen('GetFlipInterval', window);

%%
% ��ȡ�������Ȩ�޵���ֵ�������ֵ�ں���Ĵ����б�����������߼���ļ���������
topPriorityLevel = MaxPriority(window);

% ����ͼ��ĳ���ʱ����ͼ����ʾ�ĳ���֡��
numSecs = 1;
numFrames = round(numSecs / ifi);

% ������һ��ͼ����Ҫ�ȴ���֡��������������У�ÿһ֡��Ҫ����һ��ͼ��
% Note���������ֵ�������޸ģ�������waitframes = 2;�����е�ͼ��ͻ���һ֡��ˢ�£��鿴PTB���ĵ��Ի����ϸ�İ�����Ϣ
waitframes = 1;

%--------------------------------------------------------------------------
% �������Ĵ����ÿһ֡�л��Ƴ��ֵĴ̼�����ʵ�ʵ�ʵ������ȫû�б�Ҫʹ�����ַ�ʽ������һ����ֹ�Ĵ̼������Ϊ�˼��ĳ��ִ��룬��������δ��Demo��һ���ԣ�ԭ�ľ��������˼�������ǻ��ǲ��������ַ�ʽ������һ����ֹ�Ĵ̼��
% 
% �ر�ģ�
% 
% �� waitframes = 1ʱ��vbl + (waitframes - 0.5) * ifi �� vbl + 0.5 * ifi��ȫ��ͬ��
% 
%--------------------------------------------------------------------------

% -----
% ����1
% -----

% �������ǽ�չʾһ�ֽϲ�ľ�ȷ���ƴ̼�����ʱ��ķ�ʽ�����ַ�ʽ��������Ӳ��ȱ�ݵĵ�����ʹ�ã�
% �����ַ�ʽ���̼��ĳ��������̫�������ԣ����ַ�ʽ���Ƽ�ʹ��

for frame = 1:numFrames

    % ʹ�û�ɫ��ȫ��������䴰�ڣ�û��ָ��rect��Ĭ��Ϊȫ����
    Screen('FillRect', window, [0.5 0.5 0.5]*white);

    % ��ת����
    Screen('Flip', window);

end

% -----
% ����2
% -----

% ��������ָ��һ��ʱ������������ʱ���ָ��PTB����Ļ�ϻ���ͼ���ʱ��㣬��������ʹ����
% һ�����Ļˢ�¼�������ַ�ʽ���������Ǿ�׼�ĵ�֪PTB�Ƿ�����˴̼���
% vblΪʱ�������PTB�����ھ�׼���ƴ̼����ֵ�ʱ�䣬������Ϊ��λ��¼�˱���Flip���ڿ�ʼ��ʱ�䣬
% ��MATLAB������һ��˫���ȸ�������double��
% 

vbl = Screen('Flip', window);
for frame = 1:numFrames

    % ����Ļ���Ϊ��ɫ
    Screen('FillRect', window, [0.5 0 0]*white);

    % Screen('Flip')�ĵ������������Դ���һ��ʱ�����ָ����ʼˢ�µ�ʱ��㣬�������ʱ���
    % PTB���ȵȴ��´���Ļˢ�¿�ʼ��������Ļˢ��ͬ���ػ��ƻ����е�ͼ����˾���������
    % ��ȥ��0.5������ʵ���ϻ�������һ֡һ���Ƶ��ٶ��ڻ���ͼ��
    % ��Ҫע�⣬���ص�ʱ���������ʱ��㣬�ǿ�ʼ��ͼ��ʱ��Ҳ�����´���Ļˢ�µ�ʱ��㡣
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

end

% -----
% ����3
% -----

% ��������к�����2��ȫ��ͬ�����ǽ�PTB�����ȼ�����Ϊ��ߣ���˵��PTB��������������ռ����ߵ�ϵͳ��Դ��
% ���ִ��ļ�����У�PTB���������ܳ���ϵͳ��Դ�����Խ������ڴ򿪴��ں������������ȼ�

Priority(topPriorityLevel);
vbl = Screen('Flip', window);
for frame = 1:numFrames

    % Color the screen purple
    Screen('FillRect', window, [0.5 0 0.5]*255);

    % Flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

end
Priority(0);

% -----
% ����4
% -----

% ��������3��ͬ�����������ڻ�ͼָ���filp֮������һ�д��룬��֪PTB���ڼ䲻���л�ͼ����
% �������Ҫ�����ڼ���MATLAB��һЩ�����ļ���������������̼���һ֡��λ�ã������������Խ�ʡ
% ������Դ������㲻��Ҫ����ļ��㣬ʹ������3���ɡ�

Priority(topPriorityLevel);
vbl = Screen('Flip', window);
for frame = 1:numFrames

    % Color the screen blue
    Screen('FillRect', window, [0 0 0.5]*white);

    % ����MATLAB filpǰ�����л�������
    Screen('DrawingFinished', window);

    % ����ļ���(����еĻ�)

    % Flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

end
Priority(0);

% �ر����д���
sca;