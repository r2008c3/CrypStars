sequenceDiagram
	autonumber
	actor user as User
	actor dao as Admin@DAO
	participant poap as ���s���f��������
	
	user ->> poap : POAP�̔��s�\��
	poap ->> user : POAP�̔��s���e�̓��͗v��
	user ->> poap : ��]�̔��s���e�̓���
	poap ->> dao : ���s���e�̊m�F�v��
	dao ->> poap : ���s���e�̏��For���s�\�ȑ�Ă��or�۔F
	poap ->> user : ���s�m�F�ʒm�i���For���s�\���or�۔F�ʒm�B�۔F�̏ꍇ�̓V�[�P���X�I���j
	user ->> user : ���F�󋵊m�F�i��Ă�����ꍇ�͑�ĂőË�����ꍇ���̃V�[�P���X�ɐi�s�j
	user ->> poap : ���s�v���iMINT�j
	poap ->> user : �����v���E�K�X��v���Ȃǂ̊m�F
	user ->> poap : ���F
	poap ->> user : POAP���s�i�R���g���N�g���s�j