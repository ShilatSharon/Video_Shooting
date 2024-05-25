
[General]
Version=1

[Preferences]
Username=
Password=2048
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHILAT1
Name=CLIENT
Count=400

[Record]
Name=CLIENT_ID
Type=NUMBER
Size=5
Data=Sequence(0, [Inc], [WithinParent])
Master=

[Record]
Name=FNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

[Record]
Name=LNAME
Type=VARCHAR2
Size=15
Data=LastName
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=50
Data=Address1
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=10
Data='05'[11111111]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=25
Data=Email
Master=

