import sip
sip.setapi ('QString', 2)
sip.setapi ('QVariant', 2)
from PyQt4 import QtGui, QtCore
btn =QtGui.QPushButton (QtGui.__file__)
btn.show ()
