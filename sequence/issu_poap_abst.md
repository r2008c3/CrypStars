sequenceDiagram
	autonumber
	actor user as User
	actor dao as Admin@DAO
	participant poap as 発行判断処理部分
	
	user ->> poap : POAPの発行申請
	poap ->> user : POAPの発行内容の入力要求
	user ->> poap : 希望の発行内容の入力
	poap ->> dao : 発行内容の確認要求
	dao ->> poap : 発行内容の承認or発行可能な代案を提示or否認
	poap ->> user : 発行確認通知（承認or発行可能代案or否認通知。否認の場合はシーケンス終了）
	user ->> user : 承認状況確認（代案がある場合は代案で妥協する場合次のシーケンスに進行）
	user ->> poap : 発行要求（MINT）
	poap ->> user : 署名要求・ガス代要求などの確認
	user ->> poap : 承認
	poap ->> user : POAP発行（コントラクト実行）