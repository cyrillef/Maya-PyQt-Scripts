import sip
import maya.OpenMayaUI as mui
from PyQt4.QtCore import *
from PyQt4.QtGui import *

def getMayaWindow():
    ptr =mui.MQtUtil.mainWindow ()
    return sip.wrapinstance (long(ptr), QObject)
	
class Form(QDialog):
    def __init__ (self, parent=None):
        super (Form, self).__init__ (parent)
        self.setWindowTitle ('Test Dialog')
        self.setObjectName ('mainUI')
        self.mainLayout =QVBoxLayout (self)
        self.myButton =QPushButton ('myButton')
        self.mainLayout.addWidget (self.myButton)
		
global app
global form
app =qApp
form =Form (getMayaWindow ())
form.show ()