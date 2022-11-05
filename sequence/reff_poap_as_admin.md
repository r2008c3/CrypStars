```mermaid
sequenceDiagram
	autonumber
	actor dao as Admin@DAO
	participant poap as 発行SBT参照部分
	participant sbt	as DAOが発行したSBTs

	dao ->> poap : 管理者がDAOのアカウントにログイン（ウォレットなど）
	dao ->> poap : DAOが発行したSBTsの参照要求
	poap ->> sbt:DAOが発行したSBTsを参照
	sbt ->> poap : SBTsの情報を返却
	poap ->> user : SBTの情報を表示	（SBTメタデータをもとにプロジェクトごとにソート等）
```