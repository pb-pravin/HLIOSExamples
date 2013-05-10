/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='images/';

var fonts = {};


var resources = [
];
var symbols = {
"stage": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'background',
            type:'image',
            rect:['0px','0px','320px','3409px','auto','auto'],
            sizeRange:['100%','','',''],
            fill:["rgba(0,0,0,0)",im+"background.png",'0px','0px','640px','3409.02px'],
            source:['100%','','','']
         },
         {
            id:'deja_dejaface_bg',
            display:'none',
            type:'image',
            rect:['129px','270px','370px','413px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_dejaface_bg2.png",'0px','0px']
         },
         {
            id:'button_1',
            display:'none',
            type:'image',
            rect:['-80px','330px','80px','440px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_1.png",'0px','0px']
         },
         {
            id:'button_2',
            display:'none',
            type:'image',
            rect:['640px','330px','80px','440px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_2.png",'0px','0px']
         },
         {
            id:'button_3',
            display:'none',
            type:'image',
            rect:['-1px','1136px','642px','367px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_33.png",'0px','0px']
         },
         {
            id:'deja_dejaface',
            display:'none',
            type:'image',
            rect:['127px','285px','370px','413px','auto','auto'],
            opacity:1,
            fill:["rgba(0,0,0,0)",im+"deja_dejaface2.png",'0px','0px']
         },
         {
            id:'Button_Creat',
            type:'image',
            rect:['0px','1157px','623px','119px','auto','auto'],
            cursor:['pointer'],
            fill:["rgba(0,0,0,0)",im+"Button_Create.png",'0px','0px']
         },
         {
            id:'Text2',
            type:'text',
            rect:['57px','96px','531px','60px','auto','auto'],
            clip:['rect(0px 531pxpx 60pxpx 0px)'],
            text:"Create Deja",
            align:"center",
            font:['Arial, Helvetica, sans-serif',64,"rgba(236,110,64,1.00)","normal","none","normal"],
            textShadow:["rgba(0,0,0,0.65)",3,13,14],
            transform:[]
         },
         {
            id:'Text4',
            display:'none',
            type:'text',
            rect:['183px','82px','auto','auto','auto','auto'],
            text:"Edit ",
            align:"center",
            font:['Arial, Helvetica, sans-serif',64,"rgba(255,255,255,1)","normal","none","normal"]
         },
         {
            id:'deja_photo3',
            type:'image',
            rect:['120px','272px','400px','400px','auto','auto'],
            opacity:1,
            fill:["rgba(0,0,0,0)",im+"deja_photo4.png",'0px','0px']
         },
         {
            id:'Group3',
            type:'group',
            rect:['9px','1212px','617','418','auto','auto'],
            c:[
            {
               id:'machine_03',
               type:'image',
               rect:['-4px','9px','623px','422px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"machine_032.png",'0px','0px']
            },
            {
               id:'machine_03_02',
               type:'image',
               rect:['89px','63px','160px','160px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"machine_03_02.png",'0px','0px']
            },
            {
               id:'machine_03_02Copy',
               type:'image',
               rect:['89px','63px','160px','160px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"machine_03_02.png",'0px','0px']
            }]
         },
         {
            id:'machine_next',
            type:'image',
            rect:['301px','1027px','623px','119px','auto','auto'],
            tabindex:'0',
            cursor:['pointer'],
            fill:["rgba(0,0,0,0)",im+"machine_next.png",'0px','0px']
         },
         {
            id:'button_4',
            display:'none',
            type:'image',
            rect:['-96px','1056px','96px','80px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_4.png",'0px','0px']
         },
         {
            id:'button_3_group3',
            display:'none',
            type:'image',
            rect:['640px','770px','642px','367px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_3_group3.png",'0px','0px']
         },
         {
            id:'machine_03_group2',
            display:'none',
            type:'image',
            rect:['640px','770px','642px','367px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"machine_03_group2.png",'0px','0px']
         },
         {
            id:'button_selectlist',
            display:'none',
            type:'image',
            rect:['0px','1056px','642px','80px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_selectlist.png",'0px','0px']
         },
         {
            id:'button_3_group1',
            display:'none',
            type:'image',
            rect:['640px','769px','642px','367px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"button_3_group1.png",'0px','0px','100%','100%']
         },
         {
            id:'Chats_BG',
            display:'none',
            type:'image',
            rect:['0px','1136px','640px','1096px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"Chats_BG.png",'0px','0px']
         },
         {
            id:'Chats_toolbar',
            display:'none',
            type:'image',
            rect:['0px','auto','640px','86px','auto','-86px'],
            fill:["rgba(0,0,0,0)",im+"Chats_toolbar2.png",'0px','0px']
         },
         {
            id:'Chats_DejaFace_BG',
            display:'none',
            type:'image',
            rect:['2px','1136px','640px','432px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"Chats_DejaFace_BG.png",'0px','0px']
         },
         {
            id:'deja_dejaface_last',
            display:'none',
            type:'image',
            rect:['117px','275px','400px','400px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_ChangeEars03.png",'0px','0px']
         },
         {
            id:'Ellipse',
            display:'none',
            type:'ellipse',
            rect:['561px','1057px','75px','74px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(48,96,189,0.33)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'Chats_ic_text',
            display:'none',
            type:'image',
            rect:['558px','1056px','80px','80px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"Chats_ic_text.png",'0px','0px']
         },
         {
            id:'Group2_FaceChange',
            type:'group',
            rect:['119px','278px','400px','397px','auto','auto'],
            c:[
            {
               id:'deja_male_ChangeFace01',
               display:'none',
               type:'image',
               rect:['120px','275px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeFace01.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeFace02',
               display:'none',
               type:'image',
               rect:['119px','278px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeFace02.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeFace03',
               display:'none',
               type:'image',
               rect:['119px','278px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeFace03.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeFace04',
               display:'none',
               type:'image',
               rect:['119px','278px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeFace04.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeFace05',
               display:'none',
               type:'image',
               rect:['1009px','190px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeFace05.png",'0px','0px']
            }]
         },
         {
            id:'Group4',
            type:'group',
            rect:['119px','287px','62.5%','35.2%','auto','auto'],
            c:[
            {
               id:'deja_male_ChangeHair01',
               display:'none',
               type:'image',
               rect:['0px','0px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeHair01.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeHair02',
               display:'none',
               type:'image',
               rect:['0px','0px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeHair02.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeHair03',
               display:'none',
               type:'image',
               rect:['0px','0px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeHair03.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeHair04',
               display:'none',
               type:'image',
               rect:['-7px','0px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeHair04.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeHair05',
               display:'none',
               type:'image',
               rect:['0px','0px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeHair05.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeEars01',
               display:'none',
               type:'image',
               rect:['0px','10px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeEars01.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeEars02',
               display:'none',
               type:'image',
               rect:['0px','10px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeEars02.png",'0px','0px']
            },
            {
               id:'deja_male_ChangeEars03',
               display:'none',
               type:'image',
               rect:['0px','10px','400px','400px','auto','auto'],
               fill:["rgba(0,0,0,0)",im+"deja_male_ChangeEars03.png",'0px','0px']
            }]
         },
         {
            id:'Chats_Bubble',
            display:'none',
            type:'image',
            rect:['318px','1142px','308px','80px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"Chats_Bubble.png",'0px','0px']
         },
         {
            id:'Group2',
            type:'group',
            rect:['0px','0px','0','0','auto','auto'],
            c:[
            {
               id:'RoundRect2',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy2',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy7',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy6',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy5',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy10',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy9',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            },
            {
               id:'RoundRect2Copy8',
               display:'none',
               type:'rect',
               rect:['23px','798px','100px','100px','auto','auto'],
               borderRadius:["10px","10px","10px","10px"],
               fill:["rgba(48,96,189,0.3203)"],
               stroke:[0,"rgb(0, 0, 0)","none"]
            }]
         },
         {
            id:'deja_male_ChangeEars042',
            display:'none',
            type:'image',
            rect:['312px','278px','328px','328px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_Shy_Face.png",'0px','0px']
         },
         {
            id:'animation_heart2',
            display:'none',
            type:'image',
            rect:['487','389','160px','160px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_heart2.png",'0px','0px']
         },
         {
            id:'animation_heart2Copy',
            display:'none',
            type:'image',
            rect:['487','389','160px','160px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_heart2.png",'0px','0px']
         },
         {
            id:'deja_male_ChangeEars05',
            display:'none',
            type:'image',
            rect:['523','526','400px','400px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_ChangeEars05.png",'0px','0px']
         },
         {
            id:'animation_glass',
            display:'none',
            type:'image',
            rect:['496','79','280px','119px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_glass.png",'0px','0px']
         },
         {
            id:'animation_stars',
            display:'none',
            type:'image',
            rect:['584','439','160px','160px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_stars.png",'0px','0px']
         },
         {
            id:'deja_male_Shy_Face2',
            display:'none',
            type:'image',
            rect:['502','438','400px','400px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_Shy_Face.png",'0px','0px']
         },
         {
            id:'deja_male_Shy_Eyes',
            display:'none',
            type:'image',
            rect:['468px','532px','103px','21px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_Shy_Eyes.png",'0px','0px']
         },
         {
            id:'deja_male_Shy_Eyebrows',
            display:'none',
            type:'image',
            rect:['467px','520px','105px','21px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_Shy_Eyebrows.png",'0px','0px']
         },
         {
            id:'animation_Shy_red',
            display:'none',
            type:'image',
            rect:['486','558','160px','160px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_Shy_red.png",'0px','0px']
         },
         {
            id:'animation_Shy_redCopy',
            display:'none',
            type:'image',
            rect:['486','558','160px','160px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"animation_Shy_red.png",'0px','0px']
         },
         {
            id:'deja_male_Shy_Eyes22',
            display:'none',
            type:'image',
            rect:['513','458','200px','40px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"deja_male_Shy_Eyes22.png",'0px','0px']
         },
         {
            id:'logo_800',
            display:'none',
            type:'image',
            rect:['141px','338px','675px','675px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"logo_800.png",'0px','0px'],
            transform:[[],[],[],['3.35','3.35']]
         },
         {
            id:'Text',
            display:'none',
            type:'text',
            rect:['546px','1079px','auto','auto','auto','auto'],
            text:"Skip",
            font:['Arial, Helvetica, sans-serif',36,"rgba(162,113,54,1.00)","normal","none",""]
         },
         {
            id:'Text3',
            display:'none',
            type:'text',
            rect:['135px','663px','auto','auto','auto','auto'],
            text:"Enjoy Your Deja",
            align:"center",
            font:['Arial, Helvetica, sans-serif',48,"rgba(255,255,255,1.00)","normal","none",""]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_deja_male_ChangeHair02}": [
            ["style", "top", '-1px'],
            ["style", "left", '3px'],
            ["style", "display", 'none']
         ],
         "${_Chats_toolbar}": [
            ["style", "top", 'auto'],
            ["style", "bottom", '-87px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '0px']
         ],
         "${_Text2}": [
            ["style", "line-height", '60px'],
            ["color", "color", 'rgba(255,255,255,1.00)'],
            ["subproperty", "textShadow.offsetV", '13px'],
            ["style", "left", '53px'],
            ["transform", "scaleY", '1'],
            ["style", "clip", [0,531,60,0], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ],
            ["subproperty", "textShadow.blur", '14px'],
            ["style", "letter-spacing", '2px'],
            ["style", "word-spacing", '10px'],
            ["style", "width", '531px'],
            ["subproperty", "filter.hue-rotate", '0.15625deg'],
            ["subproperty", "filter.blur", '0px'],
            ["style", "height", '60px'],
            ["style", "font-size", '64px'],
            ["style", "top", '96px'],
            ["subproperty", "textShadow.offsetH", '3px'],
            ["style", "text-align", 'center'],
            ["style", "text-indent", '13px'],
            ["subproperty", "filter.invert", '0'],
            ["subproperty", "textShadow.color", 'rgba(0,0,0,0.65)'],
            ["style", "opacity", '1'],
            ["transform", "scaleX", '1']
         ],
         "${_button_selectlist}": [
            ["style", "top", '1056px'],
            ["style", "bottom", 'auto'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '0px']
         ],
         "${_deja_male_ChangeFace03}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2Copy8}": [
            ["style", "top", '920px'],
            ["style", "display", 'none'],
            ["style", "height", '100px'],
            ["style", "left", '20px'],
            ["style", "width", '100px']
         ],
         "${_RoundRect2Copy}": [
            ["style", "top", '797px'],
            ["style", "height", '100px'],
            ["style", "display", 'none'],
            ["style", "left", '271px'],
            ["style", "width", '100px']
         ],
         "${_background}": [
            ["style", "-webkit-transform-origin", [0,0], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [0,0],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [0,0],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [0,0],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [0,0],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "bottom", 'auto'],
            ["style", "background-size", [640,3409.02], {valueTemplate:'@@0@@px @@1@@px'} ],
            ["style", "cursor", 'auto'],
            ["style", "width", '640px'],
            ["style", "top", '0px'],
            ["style", "min-width", '100%'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '3409px'],
            ["style", "right", 'auto'],
            ["style", "display", 'block'],
            ["style", "left", '0px']
         ],
         "${_Ellipse}": [
            ["style", "top", '1057px'],
            ["style", "height", '74px'],
            ["color", "background-color", 'rgba(48,96,189,0.33)'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '561px'],
            ["style", "width", '75px']
         ],
         "${_deja_dejaface}": [
            ["style", "top", '275px'],
            ["style", "height", '399px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '120px'],
            ["style", "width", '399px']
         ],
         "${_Chats_BG}": [
            ["style", "top", '1137px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2Copy7}": [
            ["style", "top", '798px'],
            ["style", "height", '100px'],
            ["style", "display", 'none'],
            ["style", "left", '23px'],
            ["style", "width", '100px']
         ],
         "${_deja_male_Shy_Face2}": [
            ["style", "top", '432px'],
            ["transform", "scaleY", '1'],
            ["style", "height", '194px'],
            ["style", "display", 'none'],
            ["transform", "scaleX", '1'],
            ["style", "left", '418px'],
            ["style", "width", '194px']
         ],
         "${_animation_Shy_red}": [
            ["style", "top", '532px'],
            ["transform", "scaleX", '1'],
            ["transform", "scaleY", '1'],
            ["style", "height", '60px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '454px'],
            ["style", "width", '60px']
         ],
         "${_Text3}": [
            ["style", "letter-spacing", '0px'],
            ["color", "color", 'rgba(255,255,255,1.00)'],
            ["style", "opacity", '0'],
            ["style", "left", '135px'],
            ["style", "font-size", '48px'],
            ["style", "top", '663px'],
            ["style", "text-align", 'center'],
            ["style", "text-indent", '0px'],
            ["style", "display", 'none'],
            ["style", "word-spacing", '0px']
         ],
         "${_button_3_group1}": [
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '640px'],
            ["style", "top", '769px']
         ],
         "${_deja_male_ChangeHair03}": [
            ["style", "top", '0px'],
            ["style", "left", '2px'],
            ["style", "display", 'none']
         ],
         "${_button_1}": [
            ["style", "top", '230px'],
            ["style", "opacity", '0'],
            ["style", "left", '-80px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2Copy5}": [
            ["style", "top", '925px'],
            ["style", "height", '100px'],
            ["style", "display", 'none'],
            ["style", "left", '23px'],
            ["style", "width", '100px']
         ],
         "${_animation_glass}": [
            ["style", "top", '414px'],
            ["style", "height", '93px'],
            ["transform", "scaleY", '1'],
            ["style", "display", 'none'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '0.0985107421875'],
            ["style", "left", '413px'],
            ["style", "width", '218px']
         ],
         "${_deja_dejaface_last}": [
            ["style", "top", '275px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '1'],
            ["style", "left", '108px'],
            ["style", "display", 'none']
         ],
         "${_button_3}": [
            ["style", "top", '1165px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_machine_next}": [
            ["style", "top", '941px'],
            ["subproperty", "filter.contrast", '1.0127203525641'],
            ["style", "display", 'block'],
            ["style", "left", '5px'],
            ["style", "cursor", 'pointer']
         ],
         "${_Chats_ic_text}": [
            ["style", "top", '1056px'],
            ["style", "left", '558px'],
            ["style", "display", 'none']
         ],
         "${_Text}": [
            ["style", "top", '1079px'],
            ["style", "display", 'none'],
            ["color", "color", 'rgba(162,113,54,1.00)'],
            ["style", "left", '546px'],
            ["style", "font-size", '36px']
         ],
         "${_machine_03_02}": [
            ["style", "top", '-635px'],
            ["transform", "rotateZ", '21deg'],
            ["style", "display", 'block'],
            ["style", "left", '87px'],
            ["transform", "scaleX", '0.99']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(255,255,255,0.00)'],
            ["style", "min-width", '640px'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '1136px'],
            ["style", "max-width", '1136px'],
            ["style", "width", '640px']
         ],
         "${_deja_male_Shy_Eyebrows}": [
            ["style", "top", '520px'],
            ["transform", "scaleY", '1'],
            ["style", "height", '21px'],
            ["style", "display", 'none'],
            ["transform", "scaleX", '1'],
            ["style", "left", '467px'],
            ["style", "width", '105px']
         ],
         "${_machine_03}": [
            ["style", "top", '-696px'],
            ["transform", "scaleY", '0.99'],
            ["style", "display", 'block'],
            ["style", "left", '-3px'],
            ["transform", "scaleX", '0.99']
         ],
         "${_Button_Creat}": [
            ["style", "top", '1157px'],
            ["style", "opacity", '0'],
            ["subproperty", "filter.blur", '0px'],
            ["style", "left", '10px'],
            ["style", "cursor", 'pointer']
         ],
         "${_deja_male_ChangeEars02}": [
            ["style", "top", '-15px'],
            ["style", "left", '-8px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2Copy10}": [
            ["style", "top", '798px'],
            ["style", "display", 'none'],
            ["style", "height", '100px'],
            ["style", "left", '23px'],
            ["style", "width", '100px']
         ],
         "${_deja_male_ChangeEars03}": [
            ["style", "top", '-15px'],
            ["style", "left", '-8px'],
            ["style", "display", 'none']
         ],
         "${_deja_photo3}": [
            ["style", "top", '272px'],
            ["style", "opacity", '1'],
            ["style", "left", '120px'],
            ["style", "display", 'block']
         ],
         "${_deja_male_ChangeFace05}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_deja_male_Shy_Eyes22}": [
            ["style", "top", '352px'],
            ["style", "display", 'none'],
            ["style", "height", '34px'],
            ["style", "left", '433px'],
            ["style", "width", '168px']
         ],
         "${_Text4}": [
            ["style", "top", '156px'],
            ["style", "display", 'none'],
            ["subproperty", "filter.blur", '300px'],
            ["style", "left", '261px'],
            ["style", "opacity", '0']
         ],
         "${_button_4}": [
            ["style", "top", '1056px'],
            ["style", "opacity", '0'],
            ["style", "left", '-96px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2}": [
            ["style", "top", '798px'],
            ["style", "display", 'none'],
            ["style", "height", '100px'],
            ["style", "left", '23px'],
            ["style", "width", '100px']
         ],
         "${_Group2_FaceChange}": [
            ["style", "top", '278px'],
            ["style", "height", '397px'],
            ["style", "left", '119px'],
            ["style", "width", '400px']
         ],
         "${_RoundRect2Copy2}": [
            ["style", "top", '922px'],
            ["style", "display", 'none'],
            ["style", "height", '100px'],
            ["style", "left", '396px'],
            ["style", "width", '100px']
         ],
         "${_deja_dejaface_bg}": [
            ["style", "top", '275px'],
            ["style", "height", '400px'],
            ["style", "display", 'none'],
            ["style", "opacity", '1'],
            ["style", "left", '120px'],
            ["style", "width", '400px']
         ],
         "${_deja_male_Shy_Eyes}": [
            ["style", "top", '532px'],
            ["transform", "scaleY", '1'],
            ["style", "height", '21px'],
            ["style", "display", 'none'],
            ["transform", "scaleX", '1'],
            ["style", "left", '468px'],
            ["style", "width", '103px']
         ],
         "${_animation_stars}": [
            ["style", "top", '354px'],
            ["transform", "scaleY", '1.01'],
            ["transform", "rotateZ", '-206deg'],
            ["style", "display", 'none'],
            ["style", "left", '508px'],
            ["transform", "scaleX", '1.01']
         ],
         "${_deja_male_ChangeEars042}": [
            ["style", "top", '358px'],
            ["transform", "scaleX", '0.63'],
            ["transform", "scaleY", '0.63'],
            ["style", "display", 'none'],
            ["style", "height", '328px'],
            ["style", "opacity", '0'],
            ["style", "left", '312px'],
            ["style", "width", '328px']
         ],
         "${_button_2}": [
            ["style", "top", '230px'],
            ["style", "opacity", '0'],
            ["style", "left", '640px'],
            ["style", "display", 'none']
         ],
         "${_Chats_Bubble}": [
            ["style", "top", '1142px'],
            ["style", "opacity", '0'],
            ["style", "left", '318px'],
            ["style", "display", 'none']
         ],
         "${_deja_male_ChangeHair05}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_Group3}": [
            ["style", "left", '9px'],
            ["style", "top", '1212px']
         ],
         "${_Chats_DejaFace_BG}": [
            ["style", "top", '1136px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_deja_male_ChangeFace04}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_animation_Shy_redCopy}": [
            ["style", "top", '532px'],
            ["transform", "scaleX", '1'],
            ["transform", "scaleY", '1'],
            ["style", "height", '60px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '524px'],
            ["style", "width", '60px']
         ],
         "${_machine_03_group2}": [
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '640px'],
            ["style", "top", '769px']
         ],
         "${_button_3_group3}": [
            ["style", "display", 'none'],
            ["style", "left", '640px'],
            ["style", "top", '771px']
         ],
         "${_RoundRect2Copy6}": [
            ["style", "top", '797px'],
            ["style", "display", 'none'],
            ["style", "height", '100px'],
            ["style", "left", '271px'],
            ["style", "width", '100px']
         ],
         "${_deja_male_ChangeHair01}": [
            ["style", "top", '1px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_RoundRect2Copy9}": [
            ["style", "top", '797px'],
            ["style", "height", '100px'],
            ["style", "display", 'none'],
            ["style", "left", '146px'],
            ["style", "width", '100px']
         ],
         "${_deja_male_ChangeEars05}": [
            ["style", "top", '377px'],
            ["transform", "scaleX", '1'],
            ["transform", "scaleY", '1'],
            ["style", "height", '240px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0'],
            ["style", "left", '397px'],
            ["style", "width", '240px']
         ],
         "${_machine_03_02Copy}": [
            ["style", "top", '-632px'],
            ["transform", "rotateZ", '21deg'],
            ["style", "display", 'block'],
            ["style", "left", '380px'],
            ["transform", "scaleX", '0.99']
         ],
         "${_deja_male_ChangeFace01}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_Group2}": [
            ["style", "left", '0px'],
            ["style", "top", '0px']
         ],
         "${_deja_male_ChangeFace02}": [
            ["style", "top", '0px'],
            ["subproperty", "filter.blur", '0px'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_animation_heart2Copy}": [
            ["style", "top", '492px'],
            ["transform", "scaleX", '0.56'],
            ["transform", "scaleY", '0.56'],
            ["style", "height", '118px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0.70803833007812'],
            ["style", "left", '453px'],
            ["style", "width", '118px']
         ],
         "${_Group4}": [
            ["style", "height", '35.21%'],
            ["style", "width", '62.5%']
         ],
         "${_animation_heart2}": [
            ["style", "top", '494px'],
            ["transform", "scaleX", '0.6'],
            ["transform", "scaleY", '0.6'],
            ["style", "height", '118px'],
            ["style", "display", 'none'],
            ["style", "opacity", '0.71444702148438'],
            ["style", "left", '390px'],
            ["style", "width", '118px']
         ],
         "${_deja_male_ChangeHair04}": [
            ["style", "top", '-15px'],
            ["style", "left", '7px'],
            ["style", "display", 'none']
         ],
         "${_logo_800}": [
            ["style", "top", '338px'],
            ["transform", "scaleY", '3.35'],
            ["transform", "scaleX", '3.35'],
            ["style", "opacity", '0'],
            ["style", "left", '141px'],
            ["style", "display", 'none']
         ],
         "${_deja_male_ChangeEars01}": [
            ["style", "top", '-15px'],
            ["style", "left", '-10px'],
            ["style", "display", 'none']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 15059,
         autoPlay: false,
         labels: {
            "Label 2": 0,
            "Label 1": 8065
         },
         timeline: [
            { id: "eid883", tween: [ "style", "${_deja_male_ChangeEars01}", "display", 'block', { fromValue: 'none'}], position: 6169, duration: 0 },
            { id: "eid869", tween: [ "style", "${_deja_male_ChangeEars01}", "display", 'block', { fromValue: 'block'}], position: 6497, duration: 0 },
            { id: "eid870", tween: [ "style", "${_deja_male_ChangeEars01}", "display", 'none', { fromValue: 'block'}], position: 6868, duration: 0 },
            { id: "eid454", tween: [ "style", "${_machine_03_02Copy}", "top", '-580px', { fromValue: '-632px'}], position: 0, duration: 288, easing: "easeInOutQuint" },
            { id: "eid455", tween: [ "style", "${_machine_03_02Copy}", "top", '-819px', { fromValue: '-580px'}], position: 288, duration: 2515, easing: "easeInOutQuint" },
            { id: "eid456", tween: [ "style", "${_machine_03_02Copy}", "top", '-1587px', { fromValue: '-819px'}], position: 2803, duration: 563, easing: "easeInOutQuint" },
            { id: "eid1332", tween: [ "style", "${_logo_800}", "display", 'block', { fromValue: 'none'}], position: 14327, duration: 0 },
            { id: "eid548", tween: [ "style", "${_deja_dejaface_bg}", "opacity", '0', { fromValue: '1'}], position: 7953, duration: 802 },
            { id: "eid550", tween: [ "style", "${_deja_dejaface_bg}", "opacity", '0.96875', { fromValue: '0'}], position: 8755, duration: 1152 },
            { id: "eid311", tween: [ "style", "${_deja_dejaface_bg}", "opacity", '0', { fromValue: '0.96875'}], position: 9907, duration: 3742 },
            { id: "eid1250", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleX", '0.5', { fromValue: '1'}], position: 12310, duration: 267 },
            { id: "eid1254", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleX", '1', { fromValue: '0.5'}], position: 12577, duration: 291 },
            { id: "eid1256", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleX", '0.5', { fromValue: '1'}], position: 12868, duration: 245 },
            { id: "eid1258", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleX", '1', { fromValue: '0.5'}], position: 13113, duration: 371 },
            { id: "eid1312", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleX", '0.53', { fromValue: '1'}], position: 13681, duration: 145 },
            { id: "eid692", tween: [ "style", "${_deja_male_ChangeFace03}", "left", '0px', { fromValue: '0px'}], position: 4419, duration: 0 },
            { id: "eid317", tween: [ "style", "${_Button_Creat}", "top", '877px', { fromValue: '1157px'}], position: 10338, duration: 1151 },
            { id: "eid2066", tween: [ "style", "${_Button_Creat}", "top", '879px', { fromValue: '877px'}], position: 11489, duration: 3511 },
            { id: "eid1233", tween: [ "style", "${_animation_Shy_redCopy}", "height", '111px', { fromValue: '60px'}], position: 11913, duration: 382 },
            { id: "eid1236", tween: [ "style", "${_animation_Shy_redCopy}", "width", '111px', { fromValue: '60px'}], position: 11913, duration: 382 },
            { id: "eid136", tween: [ "style", "${_button_2}", "left", '560px', { fromValue: '640px'}], position: 3097, duration: 1049 },
            { id: "eid679", tween: [ "style", "${_deja_male_ChangeFace05}", "display", 'block', { fromValue: 'none'}], position: 5000, duration: 0 },
            { id: "eid680", tween: [ "style", "${_deja_male_ChangeFace05}", "display", 'none', { fromValue: 'block'}], position: 5325, duration: 0 },
            { id: "eid1269", tween: [ "transform", "${_animation_Shy_red}", "scaleY", '0.5', { fromValue: '1'}], position: 12295, duration: 282 },
            { id: "eid1272", tween: [ "transform", "${_animation_Shy_red}", "scaleY", '1', { fromValue: '0.5'}], position: 12577, duration: 291 },
            { id: "eid1275", tween: [ "transform", "${_animation_Shy_red}", "scaleY", '0.5', { fromValue: '1'}], position: 12868, duration: 245 },
            { id: "eid1277", tween: [ "transform", "${_animation_Shy_red}", "scaleY", '1', { fromValue: '0.5'}], position: 13113, duration: 371 },
            { id: "eid1315", tween: [ "transform", "${_animation_Shy_red}", "scaleY", '0.53', { fromValue: '1'}], position: 13681, duration: 145 },
            { id: "eid270", tween: [ "subproperty", "${_Text2}", "filter.blur", '54.230769230769px', { fromValue: '0px'}], position: 0, duration: 822 },
            { id: "eid634", tween: [ "style", "${_Chats_ic_text}", "top", '622px', { fromValue: '1056px'}], position: 9501, duration: 389 },
            { id: "eid666", tween: [ "style", "${_Chats_ic_text}", "top", '-541px', { fromValue: '622px'}], position: 13657, duration: 955 },
            { id: "eid2579", tween: [ "style", "${_deja_male_ChangeHair03}", "left", '2px', { fromValue: '2px'}], position: 5678, duration: 0 },
            { id: "eid693", tween: [ "style", "${_deja_male_ChangeFace03}", "top", '0px', { fromValue: '0px'}], position: 4419, duration: 0 },
            { id: "eid1251", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleY", '0.5', { fromValue: '1'}], position: 12310, duration: 267 },
            { id: "eid1255", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleY", '1', { fromValue: '0.5'}], position: 12577, duration: 291 },
            { id: "eid1257", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleY", '0.5', { fromValue: '1'}], position: 12868, duration: 245 },
            { id: "eid1259", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleY", '1', { fromValue: '0.5'}], position: 13113, duration: 371 },
            { id: "eid1313", tween: [ "transform", "${_animation_Shy_redCopy}", "scaleY", '0.53', { fromValue: '1'}], position: 13681, duration: 145 },
            { id: "eid1339", tween: [ "style", "${_Text}", "display", 'block', { fromValue: 'none'}], position: 14750, duration: 0 },
            { id: "eid1232", tween: [ "style", "${_animation_Shy_redCopy}", "display", 'block', { fromValue: 'none'}], position: 11913, duration: 0 },
            { id: "eid1328", tween: [ "style", "${_animation_Shy_redCopy}", "display", 'none', { fromValue: 'block'}], position: 13826, duration: 0 },
            { id: "eid2576", tween: [ "style", "${_deja_male_ChangeHair02}", "top", '-1px', { fromValue: '-1px'}], position: 5528, duration: 0 },
            { id: "eid1214", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "left", '465px', { fromValue: '467px'}], position: 11913, duration: 382 },
            { id: "eid1307", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "left", '468px', { fromValue: '465px'}], position: 13681, duration: 75 },
            { id: "eid1321", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "left", '466px', { fromValue: '468px'}], position: 13756, duration: 70 },
            { id: "eid1114", tween: [ "transform", "${_animation_heart2Copy}", "scaleY", '1.2', { fromValue: '0.56'}], position: 10021, duration: 579 },
            { id: "eid1117", tween: [ "transform", "${_animation_heart2Copy}", "scaleY", '0.86', { fromValue: '1.2'}], position: 10600, duration: 686 },
            { id: "eid1121", tween: [ "transform", "${_animation_heart2Copy}", "scaleY", '1.45', { fromValue: '0.86'}], position: 11286, duration: 518 },
            { id: "eid1139", tween: [ "transform", "${_animation_heart2Copy}", "scaleY", '0.6', { fromValue: '1.45'}], position: 11804, duration: 1853 },
            { id: "eid612", tween: [ "style", "${_Ellipse}", "opacity", '1', { fromValue: '0'}], position: 8939, duration: 150 },
            { id: "eid616", tween: [ "style", "${_Ellipse}", "opacity", '0', { fromValue: '1'}], position: 9408, duration: 93 },
            { id: "eid1119", tween: [ "style", "${_animation_heart2Copy}", "left", '473px', { fromValue: '453px'}], position: 10021, duration: 579 },
            { id: "eid696", tween: [ "style", "${_deja_male_ChangeFace05}", "left", '0px', { fromValue: '0px'}], position: 5000, duration: 0 },
            { id: "eid1241", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'block', { fromValue: 'none'}], position: 11913, duration: 0 },
            { id: "eid1293", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'none', { fromValue: 'block'}], position: 12703, duration: 0 },
            { id: "eid1296", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'block', { fromValue: 'none'}], position: 12983, duration: 0 },
            { id: "eid1298", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'none', { fromValue: 'block'}], position: 13321, duration: 0 },
            { id: "eid1299", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'block', { fromValue: 'none'}], position: 13531, duration: 0 },
            { id: "eid1325", tween: [ "style", "${_deja_male_Shy_Eyes}", "display", 'none', { fromValue: 'block'}], position: 13826, duration: 0 },
            { id: "eid608", tween: [ "style", "${_Chats_Bubble}", "opacity", '1', { fromValue: '0'}], position: 8680, duration: 209 },
            { id: "eid1008", tween: [ "style", "${_Chats_Bubble}", "opacity", '0', { fromValue: '1'}], position: 9907, duration: 593 },
            { id: "eid2577", tween: [ "style", "${_deja_male_ChangeHair02}", "left", '3px', { fromValue: '3px'}], position: 5528, duration: 0 },
            { id: "eid852", tween: [ "style", "${_RoundRect2Copy7}", "display", 'block', { fromValue: 'none'}], position: 5584, duration: 0 },
            { id: "eid853", tween: [ "style", "${_RoundRect2Copy7}", "display", 'none', { fromValue: 'block'}], position: 5740, duration: 0 },
            { id: "eid1699", tween: [ "style", "${_Text2}", "left", '53px', { fromValue: '53px'}], position: 0, duration: 0, easing: "easeOutBack" },
            { id: "eid453", tween: [ "transform", "${_machine_03_02}", "rotateZ", '-116deg', { fromValue: '21deg'}], position: 0, duration: 933, easing: "easeInOutQuint" },
            { id: "eid700", tween: [ "transform", "${_machine_03_02}", "rotateZ", '180deg', { fromValue: '-116deg'}], position: 933, duration: 2416, easing: "easeInOutQuint" },
            { id: "eid699", tween: [ "transform", "${_machine_03_02}", "rotateZ", '263deg', { fromValue: '180deg'}], position: 3349, duration: 17, easing: "easeInOutQuint" },
            { id: "eid30", tween: [ "style", "${_machine_next}", "left", '5px', { fromValue: '5px'}], position: 0, duration: 0 },
            { id: "eid142", tween: [ "style", "${_machine_next}", "left", '5px', { fromValue: '5px'}], position: 901, duration: 0 },
            { id: "eid123", tween: [ "style", "${_deja_dejaface}", "opacity", '1', { fromValue: '0'}], position: 2500, duration: 331 },
            { id: "eid818", tween: [ "style", "${_deja_dejaface}", "opacity", '1', { fromValue: '1'}], position: 4104, duration: 0 },
            { id: "eid2339", tween: [ "style", "${_machine_next}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0 },
            { id: "eid365", tween: [ "style", "${_machine_next}", "display", 'none', { fromValue: 'block'}], position: 3370, duration: 0 },
            { id: "eid538", tween: [ "style", "${_button_selectlist}", "top", '1142px', { fromValue: '1056px'}], position: 7563, duration: 196 },
            { id: "eid1584", tween: [ "style", "${_background}", "left", '0px', { fromValue: '0px'}], position: 8470, duration: 0 },
            { id: "eid1287", tween: [ "style", "${_deja_male_Shy_Eyes22}", "top", '352px', { fromValue: '352px'}], position: 12310, duration: 0 },
            { id: "eid1190", tween: [ "transform", "${_deja_male_Shy_Face2}", "scaleY", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1192", tween: [ "transform", "${_deja_male_Shy_Face2}", "scaleY", '1', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid805", tween: [ "style", "${_deja_male_ChangeHair02}", "display", 'block', { fromValue: 'none'}], position: 5528, duration: 0 },
            { id: "eid806", tween: [ "style", "${_deja_male_ChangeHair02}", "display", 'none', { fromValue: 'block'}], position: 5678, duration: 0 },
            { id: "eid2613", tween: [ "style", "${_deja_male_Shy_Face2}", "left", '417px', { fromValue: '418px'}], position: 11913, duration: 382 },
            { id: "eid111", tween: [ "style", "${_machine_03}", "top", '-644px', { fromValue: '-696px'}], position: 0, duration: 288, easing: "easeInOutQuint" },
            { id: "eid117", tween: [ "style", "${_machine_03}", "top", '-883px', { fromValue: '-644px'}], position: 288, duration: 2515, easing: "easeInOutQuint" },
            { id: "eid120", tween: [ "style", "${_machine_03}", "top", '-1652px', { fromValue: '-883px'}], position: 2803, duration: 563, easing: "easeInOutQuint" },
            { id: "eid606", tween: [ "style", "${_Chats_Bubble}", "display", 'block', { fromValue: 'none'}], position: 8680, duration: 0 },
            { id: "eid1007", tween: [ "style", "${_Chats_Bubble}", "display", 'none', { fromValue: 'block'}], position: 10500, duration: 0 },
            { id: "eid2599", tween: [ "style", "${_deja_male_ChangeEars03}", "top", '-15px', { fromValue: '-15px'}], position: 7508, duration: 0 },
            { id: "eid1212", tween: [ "transform", "${_deja_male_Shy_Eyes}", "scaleX", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1317", tween: [ "transform", "${_deja_male_Shy_Eyes}", "scaleX", '1', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid135", tween: [ "style", "${_button_1}", "left", '0px', { fromValue: '-80px'}], position: 3097, duration: 1049 },
            { id: "eid571", tween: [ "style", "${_deja_dejaface_last}", "display", 'block', { fromValue: 'none'}], position: 7720, duration: 0 },
            { id: "eid279", tween: [ "color", "${_Text2}", "color", 'rgba(255,255,255,1.00)', { animationColorSpace: 'RGB', valueTemplate: undefined, fromValue: 'rgba(255,255,255,1.00)'}], position: 0, duration: 0 },
            { id: "eid2583", tween: [ "style", "${_deja_male_ChangeHair04}", "top", '-15px', { fromValue: '-15px'}], position: 6000, duration: 0 },
            { id: "eid1227", tween: [ "style", "${_animation_Shy_red}", "opacity", '0.33895874023438', { fromValue: '0'}], position: 11913, duration: 382 },
            { id: "eid1270", tween: [ "style", "${_animation_Shy_red}", "opacity", '0.5', { fromValue: '0.3389590084552765'}], position: 12295, duration: 282 },
            { id: "eid1273", tween: [ "style", "${_animation_Shy_red}", "opacity", '0.3', { fromValue: '0.5'}], position: 12577, duration: 291 },
            { id: "eid1278", tween: [ "style", "${_animation_Shy_red}", "opacity", '0.5', { fromValue: '0.30000001192092896'}], position: 12868, duration: 616 },
            { id: "eid121", tween: [ "style", "${_deja_dejaface}", "display", 'block', { fromValue: 'none'}], position: 2500, duration: 0 },
            { id: "eid821", tween: [ "style", "${_deja_dejaface}", "display", 'block', { fromValue: 'block'}], position: 2831, duration: 0 },
            { id: "eid148", tween: [ "style", "${_deja_dejaface}", "display", 'none', { fromValue: 'block'}], position: 4104, duration: 0 },
            { id: "eid1178", tween: [ "style", "${_deja_male_Shy_Face2}", "height", '194px', { fromValue: '194px'}], position: 11913, duration: 0 },
            { id: "eid1229", tween: [ "style", "${_animation_Shy_red}", "left", '406px', { fromValue: '454px'}], position: 11913, duration: 382 },
            { id: "eid149", tween: [ "style", "${_deja_dejaface_bg}", "display", 'block', { fromValue: 'none'}], position: 4067, duration: 0 },
            { id: "eid551", tween: [ "style", "${_deja_dejaface_bg}", "display", 'none', { fromValue: 'block'}], position: 8755, duration: 0 },
            { id: "eid637", tween: [ "style", "${_deja_dejaface_bg}", "display", 'none', { fromValue: 'none'}], position: 10549, duration: 0 },
            { id: "eid498", tween: [ "style", "${_button_4}", "display", 'block', { fromValue: 'none'}], position: 4053, duration: 0 },
            { id: "eid503", tween: [ "style", "${_button_4}", "display", 'block', { fromValue: 'block'}], position: 4146, duration: 0 },
            { id: "eid677", tween: [ "style", "${_deja_male_ChangeFace04}", "display", 'block', { fromValue: 'none'}], position: 4683, duration: 0 },
            { id: "eid678", tween: [ "style", "${_deja_male_ChangeFace04}", "display", 'none', { fromValue: 'block'}], position: 5000, duration: 0 },
            { id: "eid438", tween: [ "style", "${_machine_03_02}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0 },
            { id: "eid439", tween: [ "style", "${_machine_03_02}", "display", 'none', { fromValue: 'block'}], position: 3366, duration: 0 },
            { id: "eid2651", tween: [ "style", "${_Text3}", "opacity", '1', { fromValue: '0.000000'}], position: 14692, duration: 367 },
            { id: "eid610", tween: [ "color", "${_Ellipse}", "background-color", 'rgba(48,96,189,0.33)', { animationColorSpace: 'RGB', valueTemplate: undefined, fromValue: 'rgba(48,96,189,0.33)'}], position: 9089, duration: 0 },
            { id: "eid615", tween: [ "color", "${_Ellipse}", "background-color", 'rgba(48,96,189,0.33)', { animationColorSpace: 'RGB', valueTemplate: undefined, fromValue: 'rgba(48,96,189,0.33)'}], position: 9408, duration: 0 },
            { id: "eid617", tween: [ "color", "${_Ellipse}", "background-color", 'rgba(48,96,189,0.33)', { animationColorSpace: 'RGB', valueTemplate: undefined, fromValue: 'rgba(48,96,189,0.33)'}], position: 9501, duration: 0 },
            { id: "eid603", tween: [ "style", "${_deja_dejaface_last}", "opacity", '0', { fromValue: '1'}], position: 8871, duration: 57 },
            { id: "eid278", tween: [ "style", "${_Text2}", "opacity", '0', { fromValue: '1'}], position: 0, duration: 822 },
            { id: "eid1172", tween: [ "transform", "${_animation_stars}", "scaleX", '1.59', { fromValue: '1.01'}], position: 11250, duration: 730 },
            { id: "eid1174", tween: [ "transform", "${_animation_stars}", "scaleX", '0.69', { fromValue: '1.59'}], position: 11980, duration: 1669 },
            { id: "eid2575", tween: [ "style", "${_deja_dejaface_last}", "top", '276px', { fromValue: '275px'}], position: 7673, duration: 47 },
            { id: "eid2573", tween: [ "style", "${_deja_dejaface_last}", "top", '272px', { fromValue: '276px'}], position: 7720, duration: 345 },
            { id: "eid579", tween: [ "style", "${_deja_dejaface_last}", "top", '887px', { fromValue: '272px'}], position: 8065, duration: 806 },
            { id: "eid131", tween: [ "style", "${_button_3}", "display", 'block', { fromValue: 'none'}], position: 3097, duration: 0 },
            { id: "eid484", tween: [ "style", "${_button_3}", "display", 'none', { fromValue: 'block'}], position: 8844, duration: 0 },
            { id: "eid859", tween: [ "style", "${_RoundRect2Copy10}", "display", 'block', { fromValue: 'none'}], position: 6868, duration: 0 },
            { id: "eid860", tween: [ "style", "${_RoundRect2Copy10}", "display", 'none', { fromValue: 'block'}], position: 7024, duration: 0 },
            { id: "eid850", tween: [ "style", "${_RoundRect2Copy6}", "display", 'block', { fromValue: 'none'}], position: 5740, duration: 0 },
            { id: "eid851", tween: [ "style", "${_RoundRect2Copy6}", "display", 'none', { fromValue: 'block'}], position: 5896, duration: 0 },
            { id: "eid1230", tween: [ "style", "${_animation_Shy_red}", "width", '111px', { fromValue: '60px'}], position: 11913, duration: 382 },
            { id: "eid1335", tween: [ "style", "${_logo_800}", "top", '157px', { fromValue: '338px'}], position: 14327, duration: 423 },
            { id: "eid1157", tween: [ "style", "${_animation_glass}", "left", '408px', { fromValue: '413px'}], position: 11250, duration: 597 },
            { id: "eid485", tween: [ "style", "${_Text4}", "left", '261px', { fromValue: '261px'}], position: 4814, duration: 0 },
            { id: "eid1286", tween: [ "style", "${_deja_male_Shy_Eyes22}", "left", '433px', { fromValue: '433px'}], position: 12310, duration: 0 },
            { id: "eid825", tween: [ "style", "${_deja_male_ChangeFace01}", "top", '0px', { fromValue: '0px'}], position: 4146, duration: 0 },
            { id: "eid827", tween: [ "style", "${_deja_male_ChangeFace01}", "top", '0px', { fromValue: '0px'}], position: 4500, duration: 0 },
            { id: "eid1209", tween: [ "style", "${_deja_male_Shy_Eyes}", "top", '358px', { fromValue: '532px'}], position: 11913, duration: 382 },
            { id: "eid1316", tween: [ "style", "${_deja_male_Shy_Eyes}", "top", '-24px', { fromValue: '358px'}], position: 13681, duration: 75 },
            { id: "eid1324", tween: [ "style", "${_deja_male_Shy_Eyes}", "top", '-92px', { fromValue: '-24px'}], position: 13756, duration: 70 },
            { id: "eid489", tween: [ "style", "${_button_selectlist}", "opacity", '1', { fromValue: '0'}], position: 4067, duration: 79 },
            { id: "eid511", tween: [ "style", "${_button_selectlist}", "opacity", '0.9200000166893', { fromValue: '1'}], position: 4146, duration: 705 },
            { id: "eid539", tween: [ "style", "${_button_selectlist}", "opacity", '1', { fromValue: '0.9200000166893005'}], position: 4851, duration: 2712 },
            { id: "eid540", tween: [ "style", "${_button_selectlist}", "opacity", '0', { fromValue: '1'}], position: 7563, duration: 196 },
            { id: "eid2594", tween: [ "style", "${_deja_male_ChangeEars03}", "left", '-8px', { fromValue: '-8px'}], position: 7508, duration: 0 },
            { id: "eid1234", tween: [ "style", "${_animation_Shy_redCopy}", "opacity", '0.5', { fromValue: '0'}], position: 11913, duration: 382 },
            { id: "eid1252", tween: [ "style", "${_animation_Shy_redCopy}", "opacity", '0.5', { fromValue: '0.5'}], position: 12310, duration: 0 },
            { id: "eid1253", tween: [ "style", "${_animation_Shy_redCopy}", "opacity", '0.5', { fromValue: '0.5'}], position: 12577, duration: 0 },
            { id: "eid1333", tween: [ "transform", "${_logo_800}", "scaleX", '0.4', { fromValue: '3.35'}], position: 14327, duration: 423 },
            { id: "eid2580", tween: [ "style", "${_deja_male_ChangeHair01}", "top", '1px', { fromValue: '1px'}], position: 5458, duration: 0 },
            { id: "eid2509", tween: [ "subproperty", "${_deja_male_ChangeFace02}", "filter.blur", '0px', { fromValue: '0px'}], position: 4146, duration: 0 },
            { id: "eid549", tween: [ "style", "${_deja_dejaface_bg}", "top", '-404px', { fromValue: '275px'}], position: 7953, duration: 802 },
            { id: "eid394", tween: [ "style", "${_deja_dejaface_bg}", "left", '120px', { fromValue: '120px'}], position: 4067, duration: 0 },
            { id: "eid855", tween: [ "style", "${_RoundRect2Copy8}", "display", 'block', { fromValue: 'none'}], position: 7352, duration: 0 },
            { id: "eid856", tween: [ "style", "${_RoundRect2Copy8}", "display", 'none', { fromValue: 'block'}], position: 7508, duration: 0 },
            { id: "eid544", tween: [ "style", "${_button_4}", "top", '1137px', { fromValue: '1056px'}], position: 7563, duration: 157 },
            { id: "eid830", tween: [ "style", "${_RoundRect2Copy}", "display", 'block', { fromValue: 'none'}], position: 4355, duration: 0 },
            { id: "eid831", tween: [ "style", "${_RoundRect2Copy}", "display", 'none', { fromValue: 'block'}], position: 4511, duration: 0 },
            { id: "eid368", tween: [ "style", "${_deja_dejaface_bg}", "height", '400px', { fromValue: '400px'}], position: 6096, duration: 0 },
            { id: "eid494", tween: [ "style", "${_button_3_group1}", "left", '0px', { fromValue: '640px'}], position: 3705, duration: 441 },
            { id: "eid508", tween: [ "style", "${_button_3_group1}", "left", '-641px', { fromValue: '0px'}], position: 4851, duration: 677 },
            { id: "eid628", tween: [ "style", "${_Chats_DejaFace_BG}", "left", '0px', { fromValue: '0px'}], position: 9501, duration: 0 },
            { id: "eid629", tween: [ "style", "${_Chats_DejaFace_BG}", "left", '0px', { fromValue: '0px'}], position: 9890, duration: 0 },
            { id: "eid1152", tween: [ "style", "${_animation_glass}", "top", '352px', { fromValue: '414px'}], position: 11250, duration: 294 },
            { id: "eid1245", tween: [ "style", "${_animation_glass}", "top", '287px', { fromValue: '352px'}], position: 11544, duration: 303 },
            { id: "eid1156", tween: [ "style", "${_animation_glass}", "top", '-84px', { fromValue: '287px'}], position: 11847, duration: 1810 },
            { id: "eid517", tween: [ "style", "${_machine_03_group2}", "display", 'block', { fromValue: 'none'}], position: 6247, duration: 0 },
            { id: "eid886", tween: [ "style", "${_deja_male_ChangeHair05}", "display", 'none', { fromValue: 'none'}], position: 0, duration: 0 },
            { id: "eid502", tween: [ "style", "${_button_4}", "opacity", '1', { fromValue: '0'}], position: 4053, duration: 93 },
            { id: "eid545", tween: [ "style", "${_button_4}", "opacity", '1', { fromValue: '1'}], position: 4146, duration: 0 },
            { id: "eid546", tween: [ "style", "${_button_4}", "opacity", '0', { fromValue: '1'}], position: 7563, duration: 157 },
            { id: "eid594", tween: [ "transform", "${_deja_dejaface_last}", "scaleX", '1', { fromValue: '1'}], position: 7720, duration: 0 },
            { id: "eid590", tween: [ "transform", "${_deja_dejaface_last}", "scaleX", '0.2', { fromValue: '1'}], position: 8065, duration: 806 },
            { id: "eid1165", tween: [ "style", "${_animation_glass}", "display", 'none', { fromValue: 'none'}], position: 0, duration: 0 },
            { id: "eid1162", tween: [ "style", "${_animation_glass}", "display", 'block', { fromValue: 'none'}], position: 11250, duration: 0 },
            { id: "eid1153", tween: [ "style", "${_animation_glass}", "display", 'none', { fromValue: 'block'}], position: 13657, duration: 0 },
            { id: "eid857", tween: [ "style", "${_RoundRect2Copy9}", "display", 'block', { fromValue: 'none'}], position: 7024, duration: 0 },
            { id: "eid858", tween: [ "style", "${_RoundRect2Copy9}", "display", 'none', { fromValue: 'block'}], position: 7180, duration: 0 },
            { id: "eid1181", tween: [ "style", "${_deja_male_Shy_Face2}", "width", '194px', { fromValue: '194px'}], position: 11913, duration: 0 },
            { id: "eid303", tween: [ "subproperty", "${_Text4}", "filter.blur", '0px', { fromValue: '300px'}], position: 3749, duration: 1501 },
            { id: "eid564", tween: [ "style", "${_Chats_toolbar}", "bottom", '0px', { fromValue: '-87px'}], position: 8709, duration: 46 },
            { id: "eid630", tween: [ "style", "${_Chats_toolbar}", "bottom", '434px', { fromValue: '0px'}], position: 9501, duration: 389 },
            { id: "eid663", tween: [ "style", "${_Chats_toolbar}", "bottom", '1597px', { fromValue: '434px'}], position: 13657, duration: 955 },
            { id: "eid1231", tween: [ "style", "${_animation_Shy_redCopy}", "top", '344px', { fromValue: '532px'}], position: 11913, duration: 382 },
            { id: "eid1310", tween: [ "style", "${_animation_Shy_redCopy}", "top", '-63px', { fromValue: '344px'}], position: 13681, duration: 75 },
            { id: "eid1319", tween: [ "style", "${_animation_Shy_redCopy}", "top", '-120px', { fromValue: '-63px'}], position: 13756, duration: 70 },
            { id: "eid1305", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "display", 'block', { fromValue: 'none'}], position: 11913, duration: 0 },
            { id: "eid1326", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "display", 'none', { fromValue: 'block'}], position: 13826, duration: 0 },
            { id: "eid1397", tween: [ "style", "${_background}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0 },
            { id: "eid2498", tween: [ "style", "${_background}", "display", 'block', { fromValue: 'block'}], position: 14414, duration: 0 },
            { id: "eid923", tween: [ "style", "${_deja_male_ChangeEars042}", "top", '153px', { fromValue: '358px'}], position: 10021, duration: 1069 },
            { id: "eid2608", tween: [ "style", "${_deja_male_ChangeEars042}", "top", '-335px', { fromValue: '153px'}], position: 11090, duration: 3237 },
            { id: "eid146", tween: [ "style", "${_button_1}", "top", '230px', { fromValue: '230px'}], position: 7380, duration: 0 },
            { id: "eid248", tween: [ "style", "${_button_1}", "top", '-552px', { fromValue: '230px'}], position: 7979, duration: 865 },
            { id: "eid1077", tween: [ "style", "${_animation_stars}", "display", 'block', { fromValue: 'none'}], position: 11250, duration: 0 },
            { id: "eid1083", tween: [ "style", "${_animation_stars}", "display", 'none', { fromValue: 'block'}], position: 13657, duration: 0 },
            { id: "eid443", tween: [ "style", "${_machine_03_02}", "top", '-580px', { fromValue: '-635px'}], position: 0, duration: 288, easing: "easeInOutQuint" },
            { id: "eid444", tween: [ "style", "${_machine_03_02}", "top", '-819px', { fromValue: '-580px'}], position: 288, duration: 2515, easing: "easeInOutQuint" },
            { id: "eid445", tween: [ "style", "${_machine_03_02}", "top", '-1587px', { fromValue: '-819px'}], position: 2803, duration: 563, easing: "easeInOutQuint" },
            { id: "eid471", tween: [ "style", "${_button_1}", "opacity", '1', { fromValue: '0'}], position: 3097, duration: 1049 },
            { id: "eid472", tween: [ "style", "${_button_1}", "opacity", '0.984375', { fromValue: '1'}], position: 4146, duration: 3574 },
            { id: "eid473", tween: [ "style", "${_button_1}", "opacity", '0', { fromValue: '0.984375'}], position: 7720, duration: 1124 },
            { id: "eid918", tween: [ "transform", "${_deja_male_ChangeEars042}", "scaleY", '1', { fromValue: '0.63'}], position: 10021, duration: 1069 },
            { id: "eid925", tween: [ "transform", "${_deja_male_ChangeEars042}", "scaleY", '0.51', { fromValue: '1'}], position: 11090, duration: 1074 },
            { id: "eid1193", tween: [ "style", "${_deja_male_Shy_Face2}", "display", 'block', { fromValue: 'none'}], position: 11913, duration: 0 },
            { id: "eid1329", tween: [ "style", "${_deja_male_Shy_Face2}", "display", 'none', { fromValue: 'block'}], position: 13826, duration: 0 },
            { id: "eid835", tween: [ "style", "${_RoundRect2Copy2}", "display", 'block', { fromValue: 'none'}], position: 4683, duration: 0 },
            { id: "eid836", tween: [ "style", "${_RoundRect2Copy2}", "display", 'none', { fromValue: 'block'}], position: 4839, duration: 0 },
            { id: "eid558", tween: [ "style", "${_Chats_toolbar}", "display", 'block', { fromValue: 'none'}], position: 8662, duration: 0 },
            { id: "eid972", tween: [ "style", "${_animation_heart2}", "display", 'block', { fromValue: 'none'}], position: 10021, duration: 0 },
            { id: "eid1137", tween: [ "style", "${_animation_heart2}", "display", 'none', { fromValue: 'block'}], position: 14327, duration: 0 },
            { id: "eid479", tween: [ "style", "${_button_2}", "top", '230px', { fromValue: '230px'}], position: 3097, duration: 0 },
            { id: "eid480", tween: [ "style", "${_button_2}", "top", '230px', { fromValue: '230px'}], position: 7380, duration: 0 },
            { id: "eid249", tween: [ "style", "${_button_2}", "top", '-552px', { fromValue: '230px'}], position: 7979, duration: 865 },
            { id: "eid1188", tween: [ "style", "${_deja_male_Shy_Face2}", "top", '249px', { fromValue: '432px'}], position: 11913, duration: 382 },
            { id: "eid1202", tween: [ "style", "${_deja_male_Shy_Face2}", "top", '-184px', { fromValue: '249px'}], position: 13681, duration: 91 },
            { id: "eid988", tween: [ "style", "${_animation_heart2Copy}", "display", 'block', { fromValue: 'none'}], position: 10021, duration: 0 },
            { id: "eid989", tween: [ "style", "${_animation_heart2Copy}", "display", 'none', { fromValue: 'block'}], position: 13756, duration: 0 },
            { id: "eid141", tween: [ "style", "${_button_3}", "top", '770px', { fromValue: '1165px'}], position: 3097, duration: 1049 },
            { id: "eid240", tween: [ "style", "${_button_3}", "top", '-426px', { fromValue: '770px'}], position: 7720, duration: 1063 },
            { id: "eid1359", tween: [ "style", "${_background}", "-webkit-transform-origin", [0,0], { valueTemplate: '@@0@@% @@1@@%', fromValue: [0,0]}], position: 0, duration: 0 },
            { id: "eid2821", tween: [ "style", "${_background}", "-moz-transform-origin", [0,0], { valueTemplate: '@@0@@% @@1@@%', fromValue: [0,0]}], position: 0, duration: 0 },
            { id: "eid2822", tween: [ "style", "${_background}", "-ms-transform-origin", [0,0], { valueTemplate: '@@0@@% @@1@@%', fromValue: [0,0]}], position: 0, duration: 0 },
            { id: "eid2823", tween: [ "style", "${_background}", "msTransformOrigin", [0,0], { valueTemplate: '@@0@@% @@1@@%', fromValue: [0,0]}], position: 0, duration: 0 },
            { id: "eid2824", tween: [ "style", "${_background}", "-o-transform-origin", [0,0], { valueTemplate: '@@0@@% @@1@@%', fromValue: [0,0]}], position: 0, duration: 0 },
            { id: "eid1585", tween: [ "style", "${_background}", "top", '-720px', { fromValue: '0px'}], position: 0, duration: 8249 },
            { id: "eid1586", tween: [ "style", "${_background}", "top", '-1226px', { fromValue: '-720px'}], position: 10773, duration: 1651 },
            { id: "eid1587", tween: [ "style", "${_background}", "top", '-2273px', { fromValue: '-1226px'}], position: 12424, duration: 1989 },
            { id: "eid1122", tween: [ "style", "${_animation_heart2}", "left", '370px', { fromValue: '390px'}], position: 10021, duration: 1069 },
            { id: "eid1242", tween: [ "style", "${_animation_heart2}", "left", '378px', { fromValue: '370px'}], position: 11090, duration: 1042 },
            { id: "eid667", tween: [ "style", "${_deja_male_ChangeFace01}", "display", 'block', { fromValue: 'none'}], position: 4146, duration: 0 },
            { id: "eid689", tween: [ "style", "${_deja_male_ChangeFace01}", "display", 'none', { fromValue: 'block'}], position: 4500, duration: 0 },
            { id: "eid1092", tween: [ "transform", "${_deja_male_ChangeEars05}", "scaleX", '1.38', { fromValue: '1'}], position: 11090, duration: 714 },
            { id: "eid1094", tween: [ "transform", "${_deja_male_ChangeEars05}", "scaleX", '0.67', { fromValue: '1.38'}], position: 11804, duration: 1845 },
            { id: "eid599", tween: [ "transform", "${_deja_dejaface_last}", "scaleY", '0.2', { fromValue: '1'}], position: 8065, duration: 806 },
            { id: "eid497", tween: [ "style", "${_button_3_group1}", "opacity", '1', { fromValue: '0'}], position: 3705, duration: 441 },
            { id: "eid2380", tween: [ "style", "${_deja_photo3}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0, easing: "easeInOutQuint" },
            { id: "eid2381", tween: [ "style", "${_deja_photo3}", "display", 'none', { fromValue: 'block'}], position: 3000, duration: 0, easing: "easeInOutQuint" },
            { id: "eid460", tween: [ "transform", "${_machine_03_02Copy}", "rotateZ", '-116deg', { fromValue: '21deg'}], position: 0, duration: 933, easing: "easeInOutQuint" },
            { id: "eid701", tween: [ "transform", "${_machine_03_02Copy}", "rotateZ", '181deg', { fromValue: '-116deg'}], position: 933, duration: 2333, easing: "easeInOutQuint" },
            { id: "eid698", tween: [ "transform", "${_machine_03_02Copy}", "rotateZ", '263deg', { fromValue: '181deg'}], position: 3266, duration: 17, easing: "easeInOutQuint" },
            { id: "eid299", tween: [ "style", "${_Text4}", "display", 'block', { fromValue: 'none'}], position: 3749, duration: 0 },
            { id: "eid801", tween: [ "style", "${_deja_male_ChangeHair01}", "display", 'block', { fromValue: 'none'}], position: 5325, duration: 0 },
            { id: "eid804", tween: [ "style", "${_deja_male_ChangeHair01}", "display", 'none', { fromValue: 'block'}], position: 5528, duration: 0 },
            { id: "eid507", tween: [ "style", "${_button_3_group3}", "left", '0px', { fromValue: '640px'}], position: 4851, duration: 677 },
            { id: "eid519", tween: [ "style", "${_button_3_group3}", "left", '-639px', { fromValue: '0px'}], position: 6247, duration: 500 },
            { id: "eid1189", tween: [ "transform", "${_deja_male_Shy_Face2}", "scaleX", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1191", tween: [ "transform", "${_deja_male_Shy_Face2}", "scaleX", '1', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid342", tween: [ "style", "${_deja_photo3}", "opacity", '1', { fromValue: '1'}], position: 0, duration: 0 },
            { id: "eid359", tween: [ "style", "${_deja_photo3}", "opacity", '0', { fromValue: '1'}], position: 2831, duration: 169 },
            { id: "eid1076", tween: [ "transform", "${_animation_stars}", "rotateZ", '0deg', { fromValue: '-206deg'}], position: 11250, duration: 2407 },
            { id: "eid873", tween: [ "style", "${_deja_male_ChangeEars03}", "display", 'block', { fromValue: 'none'}], position: 7508, duration: 0 },
            { id: "eid874", tween: [ "style", "${_deja_male_ChangeEars03}", "display", 'none', { fromValue: 'block'}], position: 7720, duration: 0 },
            { id: "eid475", tween: [ "style", "${_button_2}", "opacity", '1', { fromValue: '0'}], position: 3097, duration: 1049 },
            { id: "eid476", tween: [ "style", "${_button_2}", "opacity", '0.99', { fromValue: '1'}], position: 4146, duration: 3828 },
            { id: "eid477", tween: [ "style", "${_button_2}", "opacity", '0', { fromValue: '0.9900000095367432'}], position: 7974, duration: 870 },
            { id: "eid695", tween: [ "style", "${_deja_male_ChangeFace04}", "top", '0px', { fromValue: '0px'}], position: 4683, duration: 0 },
            { id: "eid557", tween: [ "style", "${_Chats_BG}", "top", '40px', { fromValue: '1137px'}], position: 7720, duration: 1035 },
            { id: "eid664", tween: [ "style", "${_Chats_BG}", "top", '-1123px', { fromValue: '40px'}], position: 13657, duration: 955 },
            { id: "eid1037", tween: [ "style", "${_deja_male_ChangeEars05}", "display", 'block', { fromValue: 'none'}], position: 11090, duration: 0 },
            { id: "eid1086", tween: [ "style", "${_deja_male_ChangeEars05}", "display", 'none', { fromValue: 'block'}], position: 13657, duration: 0 },
            { id: "eid828", tween: [ "style", "${_RoundRect2}", "display", 'block', { fromValue: 'none'}], position: 4199, duration: 0 },
            { id: "eid829", tween: [ "style", "${_RoundRect2}", "display", 'none', { fromValue: 'block'}], position: 4355, duration: 0 },
            { id: "eid605", tween: [ "style", "${_Chats_Bubble}", "top", '905px', { fromValue: '1142px'}], position: 8680, duration: 209 },
            { id: "eid636", tween: [ "style", "${_Chats_Bubble}", "top", '488px', { fromValue: '905px'}], position: 9501, duration: 389 },
            { id: "eid1006", tween: [ "style", "${_Chats_Bubble}", "top", '-99px', { fromValue: '488px'}], position: 9907, duration: 593 },
            { id: "eid930", tween: [ "style", "${_deja_male_ChangeEars042}", "opacity", '1', { fromValue: '0'}], position: 10021, duration: 1069 },
            { id: "eid1166", tween: [ "style", "${_deja_male_ChangeEars042}", "opacity", '0.50244140625', { fromValue: '1'}], position: 11090, duration: 1074 },
            { id: "eid1167", tween: [ "style", "${_deja_male_ChangeEars042}", "opacity", '0', { fromValue: '0.5024409890174866'}], position: 12164, duration: 1592 },
            { id: "eid400", tween: [ "style", "${_deja_dejaface}", "left", '120px', { fromValue: '120px'}], position: 2500, duration: 0 },
            { id: "eid819", tween: [ "style", "${_deja_dejaface}", "left", '120px', { fromValue: '120px'}], position: 2831, duration: 0 },
            { id: "eid401", tween: [ "style", "${_deja_dejaface}", "left", '120px', { fromValue: '120px'}], position: 4104, duration: 0 },
            { id: "eid807", tween: [ "style", "${_deja_male_ChangeHair03}", "display", 'block', { fromValue: 'none'}], position: 5678, duration: 0 },
            { id: "eid808", tween: [ "style", "${_deja_male_ChangeHair03}", "display", 'none', { fromValue: 'block'}], position: 5915, duration: 0 },
            { id: "eid490", tween: [ "style", "${_button_3_group1}", "display", 'block', { fromValue: 'none'}], position: 3705, duration: 0 },
            { id: "eid514", tween: [ "style", "${_button_3_group1}", "display", 'none', { fromValue: 'block'}], position: 6067, duration: 0 },
            { id: "eid816", tween: [ "style", "${_deja_dejaface}", "top", '275px', { fromValue: '275px'}], position: 2500, duration: 0 },
            { id: "eid364", tween: [ "style", "${_deja_dejaface}", "top", '275px', { fromValue: '275px'}], position: 2750, duration: 0 },
            { id: "eid820", tween: [ "style", "${_deja_dejaface}", "top", '275px', { fromValue: '275px'}], position: 2831, duration: 0 },
            { id: "eid817", tween: [ "style", "${_deja_dejaface}", "top", '275px', { fromValue: '275px'}], position: 4104, duration: 0 },
            { id: "eid1154", tween: [ "transform", "${_animation_glass}", "scaleX", '1.18', { fromValue: '1'}], position: 11250, duration: 597 },
            { id: "eid1160", tween: [ "transform", "${_animation_glass}", "scaleX", '0.54', { fromValue: '1.18'}], position: 11847, duration: 1802 },
            { id: "eid108", tween: [ "style", "${_machine_03}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0 },
            { id: "eid374", tween: [ "style", "${_machine_03}", "display", 'none', { fromValue: 'block'}], position: 3366, duration: 0 },
            { id: "eid916", tween: [ "transform", "${_deja_male_ChangeEars042}", "scaleX", '1', { fromValue: '0.63'}], position: 10021, duration: 1069 },
            { id: "eid924", tween: [ "transform", "${_deja_male_ChangeEars042}", "scaleX", '0.51', { fromValue: '1'}], position: 11090, duration: 1074 },
            { id: "eid1363", tween: [ "style", "${_background}", "background-size", [640,3409.02], { valueTemplate: '@@0@@px @@1@@px', fromValue: [640,3409.02]}], position: 0, duration: 0 },
            { id: "eid463", tween: [ "style", "${_button_3}", "left", '0px', { fromValue: '0px'}], position: 3097, duration: 0 },
            { id: "eid809", tween: [ "style", "${_deja_male_ChangeHair04}", "display", 'block', { fromValue: 'none'}], position: 5915, duration: 0 },
            { id: "eid810", tween: [ "style", "${_deja_male_ChangeHair04}", "display", 'none', { fromValue: 'block'}], position: 6169, duration: 0 },
            { id: "eid324", tween: [ "subproperty", "${_Button_Creat}", "filter.blur", '0px', { fromValue: '0px'}], position: 10338, duration: 0 },
            { id: "eid325", tween: [ "subproperty", "${_Button_Creat}", "filter.blur", '0px', { fromValue: '0px'}], position: 11489, duration: 0 },
            { id: "eid552", tween: [ "style", "${_Chats_BG}", "display", 'block', { fromValue: 'none'}], position: 7720, duration: 0 },
            { id: "eid556", tween: [ "style", "${_Chats_BG}", "opacity", '1', { fromValue: '0'}], position: 7720, duration: 1035 },
            { id: "eid109", tween: [ "style", "${_machine_03}", "left", '-3px', { fromValue: '-3px'}], position: 0, duration: 0 },
            { id: "eid110", tween: [ "style", "${_machine_03}", "left", '-3px', { fromValue: '-3px'}], position: 457, duration: 0 },
            { id: "eid285", tween: [ "style", "${_Text2}", "text-indent", '13px', { fromValue: '13px'}], position: 0, duration: 0 },
            { id: "eid1336", tween: [ "style", "${_logo_800}", "left", '-16px', { fromValue: '141px'}], position: 14327, duration: 423 },
            { id: "eid1125", tween: [ "transform", "${_animation_heart2}", "scaleY", '1.6', { fromValue: '0.6'}], position: 10021, duration: 367 },
            { id: "eid1128", tween: [ "transform", "${_animation_heart2}", "scaleY", '0.71', { fromValue: '1.6'}], position: 10388, duration: 509 },
            { id: "eid1131", tween: [ "transform", "${_animation_heart2}", "scaleY", '1.4', { fromValue: '0.71'}], position: 10897, duration: 193 },
            { id: "eid1134", tween: [ "transform", "${_animation_heart2}", "scaleY", '0.7', { fromValue: '1.4'}], position: 11090, duration: 714 },
            { id: "eid320", tween: [ "style", "${_Button_Creat}", "opacity", '1', { fromValue: '0'}], position: 10338, duration: 1151 },
            { id: "eid1284", tween: [ "style", "${_deja_male_Shy_Eyes22}", "height", '34px', { fromValue: '34px'}], position: 12310, duration: 0 },
            { id: "eid1123", tween: [ "style", "${_animation_heart2}", "top", '395px', { fromValue: '494px'}], position: 10021, duration: 367 },
            { id: "eid1129", tween: [ "style", "${_animation_heart2}", "top", '277px', { fromValue: '395px'}], position: 10388, duration: 702 },
            { id: "eid1132", tween: [ "style", "${_animation_heart2}", "top", '143px', { fromValue: '277px'}], position: 11090, duration: 823 },
            { id: "eid1141", tween: [ "style", "${_animation_heart2}", "top", '-5px', { fromValue: '143px'}], position: 11913, duration: 1003 },
            { id: "eid1135", tween: [ "style", "${_animation_heart2}", "top", '-104px', { fromValue: '-5px'}], position: 12916, duration: 1411 },
            { id: "eid1294", tween: [ "style", "${_deja_male_Shy_Eyes22}", "display", 'block', { fromValue: 'none'}], position: 12703, duration: 0 },
            { id: "eid1295", tween: [ "style", "${_deja_male_Shy_Eyes22}", "display", 'none', { fromValue: 'block'}], position: 12983, duration: 0 },
            { id: "eid1297", tween: [ "style", "${_deja_male_Shy_Eyes22}", "display", 'block', { fromValue: 'none'}], position: 13321, duration: 0 },
            { id: "eid1300", tween: [ "style", "${_deja_male_Shy_Eyes22}", "display", 'none', { fromValue: 'block'}], position: 13531, duration: 0 },
            { id: "eid1173", tween: [ "transform", "${_animation_stars}", "scaleY", '1.59', { fromValue: '1.01'}], position: 11250, duration: 730 },
            { id: "eid1175", tween: [ "transform", "${_animation_stars}", "scaleY", '0.69', { fromValue: '1.59'}], position: 11980, duration: 1669 },
            { id: "eid1210", tween: [ "transform", "${_deja_male_Shy_Eyebrows}", "scaleX", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1308", tween: [ "transform", "${_deja_male_Shy_Eyebrows}", "scaleX", '1.01', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid143", tween: [ "style", "${_machine_next}", "top", '1163px', { fromValue: '941px'}], position: 0, duration: 1000 },
            { id: "eid1215", tween: [ "style", "${_deja_male_Shy_Eyes}", "left", '466px', { fromValue: '468px'}], position: 11913, duration: 382 },
            { id: "eid1334", tween: [ "transform", "${_logo_800}", "scaleY", '0.4', { fromValue: '3.35'}], position: 14327, duration: 423 },
            { id: "eid613", tween: [ "style", "${_Ellipse}", "display", 'block', { fromValue: 'none'}], position: 8939, duration: 0 },
            { id: "eid618", tween: [ "style", "${_Ellipse}", "display", 'none', { fromValue: 'block'}], position: 9501, duration: 0 },
            { id: "eid1235", tween: [ "style", "${_animation_Shy_redCopy}", "left", '516px', { fromValue: '524px'}], position: 11913, duration: 382 },
            { id: "eid824", tween: [ "style", "${_deja_male_ChangeFace01}", "left", '0px', { fromValue: '0px'}], position: 4146, duration: 0 },
            { id: "eid826", tween: [ "style", "${_deja_male_ChangeFace01}", "left", '0px', { fromValue: '0px'}], position: 4500, duration: 0 },
            { id: "eid631", tween: [ "style", "${_Chats_ic_text}", "display", 'block', { fromValue: 'none'}], position: 9501, duration: 0 },
            { id: "eid459", tween: [ "transform", "${_machine_03_02Copy}", "scaleX", '0.99', { fromValue: '0.99'}], position: 457, duration: 0 },
            { id: "eid1228", tween: [ "style", "${_animation_Shy_red}", "height", '111px', { fromValue: '60px'}], position: 11913, duration: 382 },
            { id: "eid487", tween: [ "style", "${_button_selectlist}", "display", 'block', { fromValue: 'none'}], position: 4067, duration: 0 },
            { id: "eid522", tween: [ "style", "${_machine_03_group2}", "left", '-2px', { fromValue: '640px'}], position: 6247, duration: 500 },
            { id: "eid526", tween: [ "style", "${_machine_03_group2}", "left", '-642px', { fromValue: '-2px'}], position: 7563, duration: 348 },
            { id: "eid527", tween: [ "style", "${_machine_03_group2}", "top", '769px', { fromValue: '769px'}], position: 7615, duration: 0 },
            { id: "eid1112", tween: [ "style", "${_animation_heart2Copy}", "top", '351px', { fromValue: '492px'}], position: 10021, duration: 579 },
            { id: "eid1115", tween: [ "style", "${_animation_heart2Copy}", "top", '247px', { fromValue: '351px'}], position: 10600, duration: 686 },
            { id: "eid1118", tween: [ "style", "${_animation_heart2Copy}", "top", '180px', { fromValue: '247px'}], position: 11286, duration: 518 },
            { id: "eid1243", tween: [ "style", "${_animation_heart2Copy}", "top", '71px', { fromValue: '180px'}], position: 11804, duration: 649 },
            { id: "eid1244", tween: [ "style", "${_animation_heart2Copy}", "top", '-141px', { fromValue: '71px'}], position: 12453, duration: 1196 },
            { id: "eid465", tween: [ "style", "${_button_3}", "opacity", '1', { fromValue: '0'}], position: 3097, duration: 1049 },
            { id: "eid468", tween: [ "style", "${_button_3}", "opacity", '0.9765625', { fromValue: '1'}], position: 4146, duration: 3574 },
            { id: "eid469", tween: [ "style", "${_button_3}", "opacity", '0', { fromValue: '0.9765629768371582'}], position: 7720, duration: 1063 },
            { id: "eid2589", tween: [ "style", "${_deja_male_ChangeEars02}", "left", '-8px', { fromValue: '-8px'}], position: 6868, duration: 0 },
            { id: "eid1368", tween: [ "style", "${_background}", "height", '3409px', { fromValue: '3409px'}], position: 0, duration: 0 },
            { id: "eid1226", tween: [ "style", "${_animation_Shy_red}", "top", '344px', { fromValue: '532px'}], position: 11913, duration: 382 },
            { id: "eid1311", tween: [ "style", "${_animation_Shy_red}", "top", '-69px', { fromValue: '344px'}], position: 13681, duration: 75 },
            { id: "eid1320", tween: [ "style", "${_animation_Shy_red}", "top", '-120px', { fromValue: '-69px'}], position: 13756, duration: 70 },
            { id: "eid871", tween: [ "style", "${_deja_male_ChangeEars02}", "display", 'block', { fromValue: 'none'}], position: 6868, duration: 0 },
            { id: "eid872", tween: [ "style", "${_deja_male_ChangeEars02}", "display", 'none', { fromValue: 'block'}], position: 7508, duration: 0 },
            { id: "eid854", tween: [ "style", "${_button_3_group3}", "top", '774px', { fromValue: '771px'}], position: 5250, duration: 2017 },
            { id: "eid1268", tween: [ "transform", "${_animation_Shy_red}", "scaleX", '0.5', { fromValue: '1'}], position: 12295, duration: 282 },
            { id: "eid1271", tween: [ "transform", "${_animation_Shy_red}", "scaleX", '1', { fromValue: '0.5'}], position: 12577, duration: 291 },
            { id: "eid1274", tween: [ "transform", "${_animation_Shy_red}", "scaleX", '0.5', { fromValue: '1'}], position: 12868, duration: 245 },
            { id: "eid1276", tween: [ "transform", "${_animation_Shy_red}", "scaleX", '1', { fromValue: '0.5'}], position: 13113, duration: 371 },
            { id: "eid1314", tween: [ "transform", "${_animation_Shy_red}", "scaleX", '0.53', { fromValue: '1'}], position: 13681, duration: 145 },
            { id: "eid2587", tween: [ "style", "${_deja_male_ChangeEars01}", "top", '-15px', { fromValue: '-15px'}], position: 6169, duration: 0 },
            { id: "eid1093", tween: [ "transform", "${_deja_male_ChangeEars05}", "scaleY", '1.38', { fromValue: '1'}], position: 11090, duration: 714 },
            { id: "eid1095", tween: [ "transform", "${_deja_male_ChangeEars05}", "scaleY", '0.67', { fromValue: '1.38'}], position: 11804, duration: 1845 },
            { id: "eid129", tween: [ "style", "${_button_2}", "display", 'block', { fromValue: 'none'}], position: 3097, duration: 0 },
            { id: "eid483", tween: [ "style", "${_button_2}", "display", 'none', { fromValue: 'block'}], position: 8844, duration: 0 },
            { id: "eid130", tween: [ "style", "${_button_1}", "display", 'block', { fromValue: 'none'}], position: 3097, duration: 0 },
            { id: "eid482", tween: [ "style", "${_button_1}", "display", 'none', { fromValue: 'block'}], position: 8844, duration: 0 },
            { id: "eid1140", tween: [ "style", "${_animation_heart2Copy}", "opacity", '1', { fromValue: '0.708038330078125'}], position: 10021, duration: 819 },
            { id: "eid1169", tween: [ "style", "${_animation_heart2Copy}", "opacity", '0.99', { fromValue: '1'}], position: 10840, duration: 910 },
            { id: "eid282", tween: [ "style", "${_Text2}", "line-height", '60px', { fromValue: '60px'}], position: 0, duration: 0 },
            { id: "eid1039", tween: [ "style", "${_deja_male_ChangeEars05}", "opacity", '1', { fromValue: '0'}], position: 11090, duration: 890 },
            { id: "eid1085", tween: [ "style", "${_deja_male_ChangeEars05}", "opacity", '0.84066772460938', { fromValue: '1'}], position: 11659, duration: 746 },
            { id: "eid1087", tween: [ "style", "${_deja_male_ChangeEars05}", "opacity", '0', { fromValue: '0.84066772460938'}], position: 12405, duration: 1252 },
            { id: "eid2585", tween: [ "style", "${_deja_male_ChangeEars01}", "left", '-10px', { fromValue: '-10px'}], position: 6169, duration: 0 },
            { id: "eid673", tween: [ "style", "${_deja_male_ChangeFace02}", "display", 'block', { fromValue: 'none'}], position: 4146, duration: 0 },
            { id: "eid674", tween: [ "style", "${_deja_male_ChangeFace02}", "display", 'none', { fromValue: 'block'}], position: 4419, duration: 0 },
            { id: "eid675", tween: [ "style", "${_deja_male_ChangeFace03}", "display", 'block', { fromValue: 'none'}], position: 4419, duration: 0 },
            { id: "eid676", tween: [ "style", "${_deja_male_ChangeFace03}", "display", 'none', { fromValue: 'block'}], position: 4683, duration: 0 },
            { id: "eid2592", tween: [ "style", "${_deja_male_ChangeEars02}", "top", '-15px', { fromValue: '-15px'}], position: 6868, duration: 0 },
            { id: "eid2593", tween: [ "style", "${_deja_male_ChangeEars02}", "top", '-15px', { fromValue: '-15px'}], position: 6940, duration: 0 },
            { id: "eid848", tween: [ "style", "${_RoundRect2Copy5}", "display", 'block', { fromValue: 'none'}], position: 6068, duration: 0 },
            { id: "eid849", tween: [ "style", "${_RoundRect2Copy5}", "display", 'none', { fromValue: 'block'}], position: 6224, duration: 0 },
            { id: "eid1159", tween: [ "style", "${_animation_glass}", "opacity", '1', { fromValue: '0'}], position: 11250, duration: 597 },
            { id: "eid1246", tween: [ "style", "${_animation_glass}", "opacity", '0.65121459960938', { fromValue: '1'}], position: 11847, duration: 903 },
            { id: "eid1247", tween: [ "style", "${_animation_glass}", "opacity", '0.085296630859375', { fromValue: '0.6512150168418884'}], position: 12750, duration: 899 },
            { id: "eid495", tween: [ "style", "${_button_3_group1}", "top", '770px', { fromValue: '769px'}], position: 3705, duration: 441 },
            { id: "eid112", tween: [ "transform", "${_machine_03}", "scaleX", '0.99', { fromValue: '0.99'}], position: 457, duration: 0 },
            { id: "eid1213", tween: [ "transform", "${_deja_male_Shy_Eyes}", "scaleY", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1318", tween: [ "transform", "${_deja_male_Shy_Eyes}", "scaleY", '1', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid691", tween: [ "style", "${_deja_male_ChangeFace02}", "top", '0px', { fromValue: '0px'}], position: 4156, duration: 0 },
            { id: "eid271", tween: [ "subproperty", "${_Text2}", "filter.hue-rotate", '0.15625deg', { fromValue: '0.15625deg'}], position: 0, duration: 0 },
            { id: "eid457", tween: [ "style", "${_machine_03_02Copy}", "display", 'block', { fromValue: 'block'}], position: 0, duration: 0 },
            { id: "eid2348", tween: [ "style", "${_machine_03_02Copy}", "display", 'none', { fromValue: 'block'}], position: 3349, duration: 0, easing: "easeInOutQuint" },
            { id: "eid521", tween: [ "style", "${_machine_03_group2}", "opacity", '1', { fromValue: '0'}], position: 6247, duration: 500 },
            { id: "eid528", tween: [ "style", "${_machine_03_group2}", "opacity", '0', { fromValue: '1'}], position: 7563, duration: 348 },
            { id: "eid694", tween: [ "style", "${_deja_male_ChangeFace04}", "left", '0px', { fromValue: '0px'}], position: 4683, duration: 0 },
            { id: "eid697", tween: [ "style", "${_deja_male_ChangeFace05}", "top", '0px', { fromValue: '0px'}], position: 5000, duration: 0 },
            { id: "eid1091", tween: [ "style", "${_deja_male_ChangeEars05}", "top", '189px', { fromValue: '377px'}], position: 11090, duration: 823 },
            { id: "eid2609", tween: [ "style", "${_deja_male_ChangeEars05}", "top", '-160px', { fromValue: '189px'}], position: 11913, duration: 1744 },
            { id: "eid926", tween: [ "style", "${_deja_male_ChangeEars042}", "display", 'block', { fromValue: 'none'}], position: 10021, duration: 0 },
            { id: "eid1005", tween: [ "style", "${_deja_male_ChangeEars042}", "display", 'none', { fromValue: 'block'}], position: 13953, duration: 0 },
            { id: "eid1113", tween: [ "transform", "${_animation_heart2Copy}", "scaleX", '1.2', { fromValue: '0.56'}], position: 10021, duration: 579 },
            { id: "eid1116", tween: [ "transform", "${_animation_heart2Copy}", "scaleX", '0.86', { fromValue: '1.2'}], position: 10600, duration: 686 },
            { id: "eid1120", tween: [ "transform", "${_animation_heart2Copy}", "scaleX", '1.45', { fromValue: '0.86'}], position: 11286, duration: 518 },
            { id: "eid1138", tween: [ "transform", "${_animation_heart2Copy}", "scaleX", '0.6', { fromValue: '1.45'}], position: 11804, duration: 1853 },
            { id: "eid318", tween: [ "style", "${_Button_Creat}", "left", '10px', { fromValue: '10px'}], position: 11489, duration: 0 },
            { id: "eid627", tween: [ "style", "${_Chats_DejaFace_BG}", "top", '704px', { fromValue: '1136px'}], position: 9501, duration: 389 },
            { id: "eid665", tween: [ "style", "${_Chats_DejaFace_BG}", "top", '-459px', { fromValue: '704px'}], position: 13657, duration: 955 },
            { id: "eid501", tween: [ "style", "${_button_4}", "left", '0px', { fromValue: '-96px'}], position: 4053, duration: 93 },
            { id: "eid513", tween: [ "style", "${_button_4}", "left", '95px', { fromValue: '0px'}], position: 4851, duration: 286 },
            { id: "eid523", tween: [ "style", "${_button_4}", "left", '192px', { fromValue: '95px'}], position: 6247, duration: 250 },
            { id: "eid1142", tween: [ "style", "${_animation_stars}", "top", '-140px', { fromValue: '354px'}], position: 11250, duration: 2399 },
            { id: "eid1124", tween: [ "transform", "${_animation_heart2}", "scaleX", '1.6', { fromValue: '0.6'}], position: 10021, duration: 367 },
            { id: "eid1127", tween: [ "transform", "${_animation_heart2}", "scaleX", '0.71', { fromValue: '1.6'}], position: 10388, duration: 509 },
            { id: "eid1130", tween: [ "transform", "${_animation_heart2}", "scaleX", '1.4', { fromValue: '0.71'}], position: 10897, duration: 193 },
            { id: "eid1133", tween: [ "transform", "${_animation_heart2}", "scaleX", '0.7', { fromValue: '1.4'}], position: 11090, duration: 714 },
            { id: "eid621", tween: [ "style", "${_Chats_DejaFace_BG}", "display", 'block', { fromValue: 'none'}], position: 9501, duration: 0 },
            { id: "eid284", tween: [ "style", "${_Text2}", "word-spacing", '10px', { fromValue: '10px'}], position: 0, duration: 0 },
            { id: "eid486", tween: [ "style", "${_Text4}", "top", '82px', { fromValue: '156px'}], position: 4104, duration: 3569 },
            { id: "eid308", tween: [ "style", "${_Text4}", "top", '-257px', { fromValue: '82px'}], position: 7673, duration: 311 },
            { id: "eid505", tween: [ "style", "${_button_3_group3}", "display", 'block', { fromValue: 'none'}], position: 4851, duration: 0 },
            { id: "eid525", tween: [ "style", "${_button_3_group3}", "display", 'none', { fromValue: 'block'}], position: 7267, duration: 0 },
            { id: "eid1155", tween: [ "transform", "${_animation_glass}", "scaleY", '1.18', { fromValue: '1'}], position: 11250, duration: 597 },
            { id: "eid1161", tween: [ "transform", "${_animation_glass}", "scaleY", '0.54', { fromValue: '1.18'}], position: 11847, duration: 1802 },
            { id: "eid566", tween: [ "style", "${_Chats_toolbar}", "opacity", '1', { fromValue: '0'}], position: 8709, duration: 46 },
            { id: "eid1354", tween: [ "style", "${_background}", "width", '640px', { fromValue: '640px'}], position: 0, duration: 0 },
            { id: "eid2574", tween: [ "style", "${_deja_dejaface_last}", "left", '121px', { fromValue: '108px'}], position: 7720, duration: 345 },
            { id: "eid589", tween: [ "style", "${_deja_dejaface_last}", "left", '398px', { fromValue: '121px'}], position: 8065, duration: 806 },
            { id: "eid283", tween: [ "style", "${_Text2}", "letter-spacing", '2px', { fromValue: '2px'}], position: 0, duration: 0 },
            { id: "eid1224", tween: [ "style", "${_animation_Shy_red}", "display", 'block', { fromValue: 'none'}], position: 11913, duration: 0 },
            { id: "eid1327", tween: [ "style", "${_animation_Shy_red}", "display", 'none', { fromValue: 'block'}], position: 13826, duration: 0 },
            { id: "eid2652", tween: [ "style", "${_Text3}", "display", 'block', { fromValue: 'none'}], position: 14692, duration: 0 },
            { id: "eid690", tween: [ "style", "${_deja_male_ChangeFace02}", "left", '0px', { fromValue: '0px'}], position: 4156, duration: 0 },
            { id: "eid2584", tween: [ "style", "${_deja_male_ChangeHair04}", "left", '7px', { fromValue: '7px'}], position: 6000, duration: 0 },
            { id: "eid1211", tween: [ "transform", "${_deja_male_Shy_Eyebrows}", "scaleY", '1.61', { fromValue: '1'}], position: 11913, duration: 382 },
            { id: "eid1309", tween: [ "transform", "${_deja_male_Shy_Eyebrows}", "scaleY", '1.01', { fromValue: '1.61'}], position: 13681, duration: 145 },
            { id: "eid367", tween: [ "style", "${_deja_dejaface_bg}", "width", '400px', { fromValue: '400px'}], position: 6096, duration: 0 },
            { id: "eid440", tween: [ "transform", "${_machine_03_02}", "scaleX", '0.99', { fromValue: '0.99'}], position: 457, duration: 0 },
            { id: "eid1285", tween: [ "style", "${_deja_male_Shy_Eyes22}", "width", '168px', { fromValue: '168px'}], position: 12310, duration: 0 },
            { id: "eid1338", tween: [ "style", "${_logo_800}", "opacity", '1', { fromValue: '0'}], position: 14327, duration: 423 },
            { id: "eid1126", tween: [ "style", "${_animation_heart2}", "opacity", '1', { fromValue: '0.714447021484375'}], position: 10021, duration: 1069 },
            { id: "eid1136", tween: [ "style", "${_animation_heart2}", "opacity", '0.57', { fromValue: '1'}], position: 11090, duration: 1205 },
            { id: "eid1168", tween: [ "style", "${_animation_heart2}", "opacity", '0', { fromValue: '0.57'}], position: 12295, duration: 2032 },
            { id: "eid402", tween: [ "subproperty", "${_machine_next}", "filter.contrast", '0.9727203525641', { fromValue: '1.0127203525641'}], position: 0, duration: 855 },
            { id: "eid1248", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "top", '335px', { fromValue: '520px'}], position: 11913, duration: 382 },
            { id: "eid1306", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "top", '-36px', { fromValue: '335px'}], position: 13681, duration: 75 },
            { id: "eid1322", tween: [ "style", "${_deja_male_Shy_Eyebrows}", "top", '-106px', { fromValue: '-36px'}], position: 13756, duration: 70 },
            { id: "eid302", tween: [ "style", "${_Text4}", "opacity", '1', { fromValue: '0'}], position: 3749, duration: 318 }         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "EDGE-19885604");
