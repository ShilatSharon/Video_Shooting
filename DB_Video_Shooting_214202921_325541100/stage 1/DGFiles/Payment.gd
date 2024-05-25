
[General]
Version=1

[Preferences]
Username=
Password=2895
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHILAT1
Name=PAYMENT
Count=400

[Record]
Name=PAYMENT_ID
Type=NUMBER
Size=5
Data=Sequence(0, [Inc], [WithinParent])
Master=

[Record]
Name=PAYMENT_AMOUNT
Type=FLOAT
Size=22
Data=List(select price from Professional)
Master=

[Record]
Name=PAYMENT_DATE
Type=DATE
Size=
Data=Random(1/1/2020, 20/5/2024)
Master=

[Record]
Name=PAY_METHOD_ID
Type=NUMBER
Size=5
Data=List(select pay_method_id from PaymentMethod)
Master=

[Record]
Name=ORDER_ID
Type=NUMBER
Size=5
Data=Sequence(0, [Inc], [WithinParent])
Master=

