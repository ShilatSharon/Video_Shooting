
[General]
Version=1

[Preferences]
Username=
Password=2842
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHILAT1
Name=CUSTOMERORDER
Count=400

[Record]
Name=ORDER_ID
Type=NUMBER
Size=5
Data=Sequence(0, [Inc], [WithinParent])
Master=

[Record]
Name=ORDER_DATE
Type=DATE
Size=
Data=Random(1/1/2000, 20/5/2024)
Master=

[Record]
Name=EVENT_ID
Type=NUMBER
Size=5
Data=List(select event_id from Event)
Master=

[Record]
Name=CLIENT_ID
Type=NUMBER
Size=5
Data=List(select client_id from Client)
Master=

