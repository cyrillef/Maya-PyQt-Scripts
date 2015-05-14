import sys
from PySide import QtCore, QtGui
 
class FormExample (QtGui.QWidget):
    def __init__(self):
        super (FormExample, self).__init__ ()
        self.initUI ()
         
    def initUI (self):
        QtGui.QToolTip.setFont (QtGui.QFont ('SansSerif', 10))
        self.setToolTip ('This is my <b>QWidget</b> widget tooltip')
         
        btn =QtGui.QPushButton ('My Button', self)
        btn.setToolTip ('This is my <b>QPushButton</b>')
        btn.resize (btn.sizeHint ())
        btn.move (50, 50)
         
        self.setGeometry (300, 300, 250, 150)
        self.setWindowTitle ('My Form Example')    
        self.show ()
         
ex =FormExample ()
