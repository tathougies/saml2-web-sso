{-# LANGUAGE OverloadedStrings   #-}

module SAML2.WebSSO.Test.Credentials where

import Crypto.PubKey.RSA.Types
import Data.Either
import Data.X509 as X509
import GHC.Stack
import Prelude hiding (head)
import SAML2.WebSSO as SAML
import Text.XML.DSig as SAML
import URI.ByteString


sampleIdP :: HasCallStack => URI -> NewIdP
sampleIdP metaURI = NewIdP
  { _nidpMetadata  = metaURI
  , _nidpPublicKey = sampleIdPCert
  }

-- to generate more certs, call `mkSignCredsWithCert Nothing 192` in ghci with this module in
-- context; then get the `encodeSignedObject` record field from the certificate, and pass it to
-- `decodeSignedObject` as in the examples here.

sampleIdPPrivkey :: SAML.SignPrivCreds
sampleIdPPubkey :: SAML.SignCreds
sampleIdPCert :: X509.SignedCertificate
(sampleIdPPrivkey, sampleIdPPubkey, sampleIdPCert) =
  ( SignPrivCreds SignDigestSha256 (SignPrivKeyRSA (KeyPair (PrivateKey {private_pub = PublicKey {public_size = 192, public_n = 1825236385615082686829981801822552281245793668757656662664568735544243260083198342874114496793815447426650983140543190311453669168459129551695143179070578277699945895401517935361517106512814862763009839741333683437167687091086671669597110367935877054163085623461134458341252597891922328070669755742493104204366455884431673612053282382492967629262141815802754809127729578399875382540168957383716983426935239687352890911547660109039098431015324137357333361774688857, public_e = 17}, private_d = 536834231063259613773524059359574200366409902575781371371931981042424488259764218492386616704063366890191465629571526562192255637782096926969159758550170081676454675118093510400446207797886724342061717570980495128578731497378432843203744453600116619164833540184730292351579214968625975170289129584598638586628840891586028758880577428210289252290954745162206609599657832405046995441606039153696516294106160931718772523817568332169962980387935630165058411857225793, private_p = 1408584324286305536461660321610687826309747570878072517266997224150546200816414282738962928862356015108202844323931598811915889582989586732935020417082497224055485902585947153087847890620641546149907491562244183456389982434327819029, private_q = 1295794901409175012540991265222363638036135696120521495224689491004311532193414114114076246969503304018375139847541296870335362753499306215287695180956211200205662925441027139431661173709926381629753732735452159538406152327132302133, private_dP = 165715802857212416054312979013022097212911478926832060854940849900064258919578150910466226924983060600965040508697835154343045833292892556815884754950882026359468929715993782716217398896546064252930293124969903936045880286391508121, private_dQ = 457339376967944122073291034784363636953930245689595821844008055648580540774146157922615145989236460241779461122661634189530128030646813958336833593278662776543175150155656637446468649544679899398736611553688997484143347880164341929, private_qinv = 1166453595319349588427991988293734177369744099337083142382991822395028451721547407635299602461878891038570450654877543188634860062629426191366702291794620098591017868209994898858991328804814767264585715915135689652618491628445860264})))
  , SignCreds SignDigestSha256 (SignKeyRSA (PublicKey {public_size = 192, public_n = 1825236385615082686829981801822552281245793668757656662664568735544243260083198342874114496793815447426650983140543190311453669168459129551695143179070578277699945895401517935361517106512814862763009839741333683437167687091086671669597110367935877054163085623461134458341252597891922328070669755742493104204366455884431673612053282382492967629262141815802754809127729578399875382540168957383716983426935239687352890911547660109039098431015324137357333361774688857, public_e = 17}))
  , either error id $ decodeSignedObject "0\130\SOH\255\&0\130\SOH(\160\ETX\STX\SOH\STX\STX\SO\DC3 Y\141j\211\RS\169\160\EOT\240\NAK\144\ENQ0\r\ACK\t*\134H\134\247\r\SOH\SOH\v\ENQ\NUL0\NUL0\RS\ETB\r180816124357Z\ETB\r380811124357Z0\NUL0\129\221\&0\r\ACK\t*\134H\134\247\r\SOH\SOH\SOH\ENQ\NUL\ETX\129\203\NUL0\129\199\STX\129\193\NUL\193\219\224\215\181\207g\DLE\SIT\215qY\152\a-\DLE\212I\230B^H\157\192\159\v\175\222\SUB\186t\170\150\185\178\166\144>Tm\189-\212\DC1\204\233\STX\a\253\154_\164/\166\138\231\172D\EOT}\153\191\249\165\146\240Do\DLE\DC2\197XZ\220\184\\\"\SIS4\b4\190m\138$\DC1\181\165\155\199\199\195\136*\SUBC\t\246\155\145\"E\248\204W\190\212\235\167BSE\244+\216\DC1\228z\ACKM_xBh^I\ESC!\136\&0\CAN\167M\FS\EOT\139\151n\r\243T\176\154\ACK\228\204\r\171\248kw\186Kv3\150\130\206\STX.SU\232\191\183\174\248ab\223\158\209\ENQ\RS\135\212+dU\US\133|^\206W\216|\253\250Y\STX\SOH\DC10\r\ACK\t*\134H\134\247\r\SOH\SOH\v\ENQ\NUL\ETX\129\193\NULmf\171\209\&9'\213\215\&9\217\194\207a\232\206\248\246\rGF\153\183\190\230\247D\160\EM9g\234?d\SUB\131c\v\248\CAN\192\168B\a\213 \SUBA&e\NAK\178\145\176\163\&6\ACK\159\208\164nA\202\200p\175\SUB\DC2\245\171\172<\220\167\186S\NUL\237\209\SI\189c\132\197\250\152;\213c\255G\163\199\NUL&\138[\RS*\181_\191}\247\202\247 U\DC3Q\168\255\203\&3\SUB\158\255\193\240\220\f~R_7\186\194\EM-\SOf\226\197\189\252\133\NAK\194P\203\147}]t\137\SIV\156vQ\"\139\245\229C^5a\"^\226\182\STXq?!\180\193\205\b\244\a\DELel\191\r\182\226\151\f\245\180w\EMI\155\&1I\211E[\233"
  )

sampleIdPPrivkey2 :: SAML.SignPrivCreds
sampleIdPPubkey2 :: SAML.SignCreds
sampleIdPCert2 :: X509.SignedCertificate
(sampleIdPPrivkey2, sampleIdPPubkey2, sampleIdPCert2) =
  ( SignPrivCreds SignDigestSha256 (SignPrivKeyRSA (KeyPair (PrivateKey {private_pub = PublicKey {public_size = 192, public_n = 1586537019004280520586697134690818707414663636760862873196097355199481346849224521791887509569583091263232363965588482539526834906843876502701501446048403811709026934300969768386434941474367413796746765023617532939304220409869870239091025764302735318523380023976738454056663892960615232861846296999295672928378724526258251401125594785383160730561117069558664991081647726320678333424265157441163758409215463929043153266277279790172282609195740695986340002309299949, public_e = 17}, private_d = 93325707000251795328629243217106982789097860985933110188005726776440079226424971870111029974681358309601903762681675443501578523931992735453029496826376694806413349076527633434496173027903965517455692060212796055253189435874698249209758722704298843290615761787866781013095793264593492485885534375254159793283228278940460785309915401236391752388078025033882998019600561406997924914901888184891331361419124268672107344039646255414278359054744971018692749299459661, private_p = 1349340328459348786335615464925552335111408577350301214968606474759696238989727528373193940544382293913331135416318601795948317680384821880230614807921941082872560921767839255139219935778853708734223343154822730644909911870744108707, private_q = 1175787149870306196247296608657450841722626830112224645633185737860278717452836315411076477506474739051033365523645188848034336344363616302171098801948991975425450203497251096222397392638749584713906207350442345543758651393474377007, private_dP = 476237762985652512824334869973724353568732439064812193518331696974010437290492068837597861368605515498822753676347741810334700357782878310669628755737155676307962678271002090049136447921948367788549415231113904933497615954380273661, private_dQ = 968295299893193338086008971835547752006869154210067355227329431179053061431747553867945334417096843924380418666531331992498865224770036954729140189840346332703311932291853843947856676290734952117334523700364284565448301147567134005, private_qinv = 441379150985148999182205626731592406273260183171479112318876269364160478514689043733460624194078294852520908570550066917968423075104648432369178474966428453670074884327694755279844904122728881693429270325743403175565742349148839188})))
  , SignCreds SignDigestSha256 (SignKeyRSA (PublicKey {public_size = 192, public_n = 1586537019004280520586697134690818707414663636760862873196097355199481346849224521791887509569583091263232363965588482539526834906843876502701501446048403811709026934300969768386434941474367413796746765023617532939304220409869870239091025764302735318523380023976738454056663892960615232861846296999295672928378724526258251401125594785383160730561117069558664991081647726320678333424265157441163758409215463929043153266277279790172282609195740695986340002309299949, public_e = 17}))
  , either error id $ decodeSignedObject "0\130\SOH\255\&0\130\SOH(\160\ETX\STX\SOH\STX\STX\SO\DC3 Y\141j\211\RS\169\160\EOT\240\NAK\144\ENQ0\r\ACK\t*\134H\134\247\r\SOH\SOH\v\ENQ\NUL0\NUL0\RS\ETB\r180827152826Z\ETB\r380822152826Z0\NUL0\129\221\&0\r\ACK\t*\134H\134\247\r\SOH\SOH\SOH\ENQ\NUL\ETX\129\203\NUL0\129\199\STX\129\193\NUL\168\129\174~\167xP\175J\133;,\216\207\214L\CAN\180\167B\a\203\237\252-\150\DC3\174\SUB\130&\SYN\210C\199\STX%\218#\155\231kaZ\239j\220Oa\166k\232\DC3\252\154\240@\207'\US\f\255r\135\171\178<g\220\174\GS\138\187\SYN\212@<[\248\&9e\211\133x\198\141\177;\166s\EM^\166\222pr\136y\EOT\ACK\n\232*J\149\214\232w\180ZE\192H\"\ETB\131{H\224\145\ETB\219\167 \DC4\180R\231J\DC2\rQ\138>.\NULr?\ACK\DC3\140>\170i/\229\234\242@\145\182\252L\DC4\152\GS\ETB\156'\192\NAKk\201~\211i<\ACK5\\\172\222\&3y*Y\245*l\227\145^o\175\173\149\254<\155c^\237\STX\SOH\DC10\r\ACK\t*\134H\134\247\r\SOH\SOH\v\ENQ\NUL\ETX\129\193\NUL \n\181\138\DC1\188/\128\178u\v\217\184p=W5\198\131&\157/\182'\213\132b\250\224/\STXd\185\162\NUL\218\255\174\239H\SYN+\227\142\253\247\NUL\251\239\231\198\SO\SI\131\149j\134d\250f\181\187\210\CAN\ACKi\255\230\183\249>\145H!\233\167J\216\147~\249g\DC3\170\SOT\234\161\f\150\131h\FS\249h\145\SYN\USO\SOHIV\148bm\133\SI\191\187\193'fRl\131\203\242\207\197\170\139q9\164\161\206\DC2<\251z\253<\"\154\203\255<\DELI\b\SO\213\185\212\241\220\152\198\165\227(\134\243\233R-\CAN\150@\135R\199\248z\EOT<9K\149\242\&6\248\ESC\193y\205\167)4\a1Lx\NAK\v(\135\225\152\220\ENQ\219"
  )