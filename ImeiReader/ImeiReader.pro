# Harmattan scope.
# Refer http://wiki.meego.com/index.php?title=Porting_Fremantle_Applications_to_Harmattan#Harmattan_scope page.
exists($$QMAKE_INCDIR_QT"/../qmsystem2/qmkeys.h"):!contains(MEEGO_EDITION,harmattan): {
  MEEGO_VERSION_MAJOR     = 1
  MEEGO_VERSION_MINOR     = 2
  MEEGO_VERSION_PATCH     = 0
  MEEGO_EDITION           = harmattan
  DEFINES += MEEGO_EDITION_HARMATTAN

  ## Other harmattan-specific things:
  ## Add qmsystem2 http://apidocs.meego.com/1.2/qmsystem/main.html
  ## for MeeGo::QmDisplayState()::setBlankingPause(), etc.
#  CONFIG += qmsystem2 \
#  	    mobility \
#	    multimedia
}

# Add more folders to ship with the application, here
folder_01.source = qml/ImeiReader
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

#symbian:TARGET.UID3 = 0xE0CFB44A

# Platform specific files and configuration
symbian {
    #TARGET = ImeiReader
    TARGET.UID3 = 0xE0CFB44A
    DEFINES += IMEIREADER_VERSION=\\\"1.0.0.0\\\"
    #platform_qml.source = qml/symbian/ImeiReader
    #platform_qml.target = qml
} else:contains(MEEGO_EDITION,harmattan): {
    DEFINES += IMEIREADER_VERSION=\\\"1.0.0.0\\\"
    #platform_qml.source = qml/harmattan/ImeiReader
    #platform_qml.target = qml
}

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
#symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=
CONFIG += mobility
MOBILITY += systeminfo

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    settings.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog

HEADERS += \
    settings.h

RESOURCES += \
    resources.qrc
