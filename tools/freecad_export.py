import Mesh
import Import 
import FreeCADGui as Gui

Gui.setupWithoutGUI()

document = FreeCAD.openDocument('Tanmatsu_3D-printed.FCStd')

# If you want a smaller file to test on use this one instead. 
#document = FreeCAD.openDocument('test_freecad_file.FCStd')

body_list = [[o.Name, o.Label] for o in App.ActiveDocument.Objects if o.isDerivedFrom("PartDesign::Body") ]
print(body_list)

for body_label in body_list:
    print("Name:  " + body_label[0])
    print("Label: " + body_label[1])
    body = []
    body.append( document.getObject(body_label[0] ))
    Import.export(body, 'release/' + body_label[1] + ".step")
    Mesh.export(body,'release/' + body_label[1] + ".amf", exportAmfCompressed=True)
    print("\nExported STEP and AMF file.")
    del body

FreeCAD.closeDocument(document.Name)

quit()
