%%
% ���ĵ����д��붼����ֱ������
%%
% ���������Ļ�ͱ���
sca;
close all;
clearvars;

% �ڹٷ�demo�У�ʹ����Ĭ������ PsychDefaultSetup(2);
% ���Ǵ�����˶����ڱʼǱ���������ɹ�����������ıʼǱ����Բ���ͨ��PTB�ļ�⣬���Ҫ������Щ���
Screen('Preference', 'SkipSyncTest', 1);

% ����һ̨�����Ͽ��԰�װ�����Ļ������Ҫ��⵱ǰ����Щ��Ļ���ڵ�����
% ��������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ������ֻ��һ����Ļ����Ĭ�ϱ��Ϊ0
% �����ҵıʼǱ������˶����һ����ʾ���������������������[0,1]����һ��ֵָ���ҵıʼǱ����Դ�����Ļ���ڶ���ֵָ���������ӵ���Ļ�����������ĵ��Կ��Բ鿴�����Ļƫ�����ò鿴�ĸ���ĻΪ����Ļ��
screens = Screen('Screens');

% ����ж����Ļ�Ļ���ѡ������һ��
% �������������Ļ��ѡ�����Ľ�������ʾ�������Ļ�ϣ�ѡ����С�Ľ�������ʾ������Ļ��
screenNumber = max(screens);

% ��ð�ɫ�ͺ�ɫ����ɫֵ������Ĭ�����Ƿֱ�Ϊ0��255
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% �����ɫ����ɫֵ
grey = white / 2;

% �ٷ�demo��ʹ��PsychImaging�򿪴��ڣ�PsychImaging��PTB���Ǹ��ײ�Ĵ��룬ʹ��Screen����
% ��һ�����ڣ�����������Ϊ��ɫ�����صĵ�һ��ֵΪ���ڵľ����ʵ��������һ��double������˵�Ǵ��ڵı�ţ����ڶ���ֵΪ1*4��������ǰ����ֵΪ��Ļ���Ͻǵ�X��ˮƽ����Y����ֱ�����꣬Ϊ0,0��������ֵΪ��Ļ���½ǵ�����ֵ��Ϊ���ڵĴ�С��
[window, windowRect] = Screen('OpenWindow', screenNumber, grey);

% ��KbStrokeWait���ƵĻ���KbWait��KbWait������⵱ǰ�Ƿ��а��������£�����У�
% �����ִ�г���KbStrokeWait���ȴ���ǰ���еİ���ȫ���ͷţ��ټ���Ƿ����µİ��������£�����У������ִ�г���
% ����������������ִ��
KbStrokeWait;

% �ر����д���
sca;