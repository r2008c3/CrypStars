```mermaid
sequenceDiagram
	autonumber
	actor user as User(通常のユーザ)
	participant poap as 発行SBT参照部分
	participant sbt	

	user ->> poap : ログイン（ウォレットなど）
	user ->> poap : 自分のSBTsの参照要求
	poap ->> sbt:userの所持するSBTsを参照（鍵の所在を確認し所有権も含めて）
	sbt ->> poap : SBTsの情報を返却
	poap ->> user : SBTの情報を表示	
```