when defined SecondCompile:
  const DO_CHECK = false;const DEBUG = false
else:
  const DO_CHECK = true;const DEBUG = true
const
  USE_DEFAULT_TABLE = true
  DO_TEST = false


include lib/header/chaemon_header

solveProc solve(N:int):
  let ans = "88817841970012523233890533447265625000000000000000000000000266453525910037569701671600341796875000000000000000000000000444089209850062616169452667236328125000000000000000000000000621724893790087662637233734130859375000000000000000000000000799360577730112709105014801025390625000000000000000000000000976996261670137755572795867919921875000000000000000000000001154631945610162802040576934814453125000000000000000000000001332267629550187848508358001708984375000000000000000000000001509903313490212894976139068603515625000000000000000000000001687538997430237941443920135498046875000000000000000000000001865174681370262987911701202392578125000000000000000000000002042810365310288034379482269287109375000000000000000000000002220446049250313080847263336181640625000000000000000000000002398081733190338127315044403076171875000000000000000000000002575717417130363173782825469970703125000000000000000000000002753353101070388220250606536865234375000000000000000000000002930988785010413266718387603759765625000000000000000000000003108624468950438313186168670654296875000000000000000000000003286260152890463359653949737548828125000000000000000000000003463895836830488406121730804443359375000000000000000000000003641531520770513452589511871337890625000000000000000000000003819167204710538499057292938232421875000000000000000000000003996802888650563545525074005126953125000000000000000000000004174438572590588591992855072021484375000000000000000000000004352074256530613638460636138916015625000000000000000000000004529709940470638684928417205810546875000000000000000000000004707345624410663731396198272705078125000000000000000000000004884981308350688777863979339599609375000000000000000000000005062616992290713824331760406494140625000000000000000000000005240252676230738870799541473388671875000000000000000000000005417888360170763917267322540283203125000000000000000000000005595524044110788963735103607177734375000000000000000000000005773159728050814010202884674072265625000000000000000000000005950795411990839056670665740966796875000000000000000000000006128431095930864103138446807861328125000000000000000000000006306066779870889149606227874755859375000000000000000000000006483702463810914196074008941650390625000000000000000000000006661338147750939242541790008544921875000000000000000000000006838973831690964289009571075439453125000000000000000000000007016609515630989335477352142333984375000000000000000000000007194245199571014381945133209228515625000000000000000000000007371880883511039428412914276123046875000000000000000000000007549516567451064474880695343017578125000000000000000000000007727152251391089521348476409912109375000000000000000000000007904787935331114567816257476806640625000000000000000000000008082423619271139614284038543701171875000000000000000000000008260059303211164660751819610595703125000000000000000000000008437694987151189707219600677490234375000000000000000000000008615330671091214753687381744384765625000000000000000000000008792966355031239800155162811279296875000000000000000000000008970602038971264846622943878173828125000000000000000000000009148237722911289893090724945068359375000000000000000000000009325873406851314939558506011962890625000000000000000000000009503509090791339986026287078857421875000000000000000000000009681144774731365032494068145751953125000000000000000000000009858780458671390078961849212646484375000000000000000000000010036416142611415125429630279541015625000000000000000000000010214051826551440171897411346435546875000000000000000000000010391687510491465218365192413330078125000000000000000000000010569323194431490264832973480224609375000000000000000000000010746958878371515311300754547119140625000000000000000000000010924594562311540357768535614013671875000000000000000000000011102230246251565404236316680908203125000000000000000000000011279865930191590450704097747802734375000000000000000000000011457501614131615497171878814697265625000000000000000000000011635137298071640543639659881591796875000000000000000000000011812772982011665590107440948486328125000000000000000000000011990408665951690636575222015380859375000000000000000000000012168044349891715683043003082275390625000000000000000000000012345680033831740729510784149169921875000000000000000000000012523315717771765775978565216064453125000000000000000000000012700951401711790822446346282958984375000000000000000000000012878587085651815868914127349853515625000000000000000000000013056222769591840915381908416748046875000000000000000000000013233858453531865961849689483642578125000000000000000000000013411494137471891008317470550537109375000000000000000000000013589129821411916054785251617431640625000000000000000000000013766765505351941101253032684326171875000000000000000000000013944401189291966147720813751220703125000000000000000000000014122036873231991194188594818115234375000000000000000000000014299672557172016240656375885009765625000000000000000000000014477308241112041287124156951904296875000000000000000000000014654943925052066333591938018798828125000000000000000000000014832579608992091380059719085693359375000000000000000000000015010215292932116426527500152587890625000000000000000000000015187850976872141472995281219482421875000000000000000000000015365486660812166519463062286376953125000000000000000000000015543122344752191565930843353271484375000000000000000000000015720758028692216612398624420166015625000000000000000000000015898393712632241658866405487060546875000000000000000000000016076029396572266705334186553955078125000000000000000000000016253665080512291751801967620849609375000000000000000000000016431300764452316798269748687744140625000000000000000000000016608936448392341844737529754638671875000000000000000000000016786572132332366891205310821533203125000000000000000000000016964207816272391937673091888427734375000000000000000000000017141843500212416984140872955322265625000000000000000000000017319479184152442030608654022216796875000000000000000000000017497114868092467077076435089111328125000000000000000000000017674750552032492123544216156005859375000000000000000000000017852386235972517170011997222900390625000000000000000000000018030021919912542216479778289794921875000000000000000000000018207657603852567262947559356689453125000000000000000000000018385293287792592309415340423583984375000000000000000000000018562928971732617355883121490478515625000000000000000000000018740564655672642402350902557373046875000000000000000000000018918200339612667448818683624267578125000000000000000000000019095836023552692495286464691162109375000000000000000000000019273471707492717541754245758056640625000000000000000000000019451107391432742588222026824951171875000000000000000000000019628743075372767634689807891845703125000000000000000000000019806378759312792681157588958740234375000000000000000000000019984014443252817727625370025634765625000000000000000000000020161650127192842774093151092529296875000000000000000000000020339285811132867820560932159423828125000000000000000000000020516921495072892867028713226318359375000000000000000000000020694557179012917913496494293212890625000000000000000000000020872192862952942959964275360107421875000000000000000000000021049828546892968006432056427001953125000000000000000000000021227464230832993052899837493896484375"
  doAssert ans.len <= 10000
  echo ans
  discard

when not defined(DO_TEST):
  var N = nextInt()
  solve(N)
else:
  discard
