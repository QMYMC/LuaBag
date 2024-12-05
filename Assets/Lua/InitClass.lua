--常用的别名定位
require("Object")
require("SplitTools")
Json = require("JsonUtility")
--Unity相关
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
Vector3 = CS.UnityEngine.Vector3
Vector2=CS.UnityEngine.Vector2
--图集对象
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas
--UI相关
UI = CS.UnityEngine.UI
Image = UI.Image
Text=UI.Text
Button = UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
TextAsset = CS.UnityEngine.TextAsset
Canvas = GameObject.Find("Canvas").transform
TMP_Text = CS.TMPro.TMP_Text
UIBehaviour=CS.UnityEngine.EventSystems.UIBehaviour
--自己写的
ABManager=CS.ABMgr.GetInstance()