module Js = Js_of_ocaml.Js

(* let key = Demo.Verification_key.Processed.t_of_sexp *)

(* let verification_key = Snark_keys.blockchain_verification () *)

(* let deserialize js_str = *)
(*   let str = Js.to_bytestring js_str in *)
(*   let strlen = String.length str in *)
(*   let buf = Core_kernel.Bin_prot.Common.create_buf strlen in *)
(*   Core_kernel.Bin_prot.Common.blit_string_buf str buf ~len:strlen; *)
(*   Demo.Verification_key.bin_read_t buf ~pos_ref:(ref 0) *)

(* let deserialize_buffer buf = *)
(*   Demo.Verification_key.bin_read_t buf ~pos_ref:(ref 0) *)

(* let deserialize_processed_buffer buf = *)
(*   Demo.Verification_key.Processed.bin_read_t buf ~pos_ref:(ref 0) *)

(* module Checked_data = struct *)
(*   type 'a t = {checksum: Core_kernel.Md5.t; data: 'a} [@@deriving bin_io] *)
(* end *)

(* Demo.Verification_key. *)
(* let key = [%sexp: Demo.Verification_key.Processed.t] "(14124124214124)" *)

(* let deserialize_processed_buffer buf = *)
(*   let thing = *)
(*     (Checked_data.bin_read_t Core_kernel.Bin_prot.Read.bin_read_string) buf *)
(*     ~pos_ref:(ref 0) in *)
(*   Core_kernel.Binable.of_string (module Demo.Verification_key.Processed) thing.data *)

(* let deserialize_sexp buf = *)
(*   let thing = *)
(*     (Checked_data.bin_read_t Core_kernel.Bin_prot.Read.bin_read_string) buf *)
(*     ~pos_ref:(ref 0) in *)
(*   Core_kernel.Binable.of_string (module Demo.Verification_key.Processed) thing.data *)

(* let _ = Reader.load_bin_prot *)
(*         ~max_len:(5 * 512 * 1024 * 1024 (1* 2.5 GB *1)) *)
(*         location *)
(*         (bin_reader_t String.bin_reader_t   ) *)

let key_string =
  {|
((alpha_beta
  ((15564959268594418541183032295849822234925370643108935833131588414105549072168627319566619304598314865249324373540384157268444861383539072193070375738510125458578917335052417219198012501640168887541645438869247679196032785185836
    1795916617498830153878100901365755214481941792016287820460292597912466434950973140055829900584361022627267626658721529403053858620838346983411446730682596055413672583302488043797404307222323477479366197501028647247361774403338
    37749845094841652282886791845998730557289366576587797395588731362658309527342358209315353252915667995296563665976800273587255465459337345120904207348864939250147905172279265725710953201937430133350947565774777906492187868094342)
   (27302796732868086136768963718574068521646437849640135291373511262572747769759399653596027398468278991540466028784651174865448089369278622533229486527775415133189923028504206401988280467414778646390851634621920976863341659792096
    16753787968487386345869111876386564046354817586867053691160398398783950550394619274463820746255239048512349273515308658479760547127067750747041145313498790672949751406887508984546590282312683340778736624649450409190151765626684
    4765872818486750670293195457771473032215664543229936660947470833054433859396889360628048956682651248559658412381126173132113187291233829319728018640953161434627099583953560731741671052831656561772365560310852656099970793003280)))
 (delta
  ((x
    (36408571441818264288205101202163748879824147301185992398868502435070235693155391171143808011999487906819640463199831394237517907589389509365850694694568656785769140599464142347137499730487837000664734944285894716126783748870267
     11149478933572199338244108938490799876148493545686843113555675482182856626990180864442050267768930772170918651494688665633599337025635783513913362989186395335610174734359779001738703228657716357656575390676920957724556728547803
     14506596086740673723436270576704754449107029502165619284452413312210677338104948505145669996940983951003974338013226474944484632561741062067282018651981957754136791949522146546132758149468377244936131117187039954509373741487213))
   (y
    (36981464242564251632551412302581987475897970796093463941222871081210215573628955825980788105442283770732964701010273222246034617641935861564523056025260957152596040381344212757387590162563255752485934690434273360811595840775886
     5429855455868987784222354604636787173213342059782433247032407233288842325716356525395896322716486094667524541057159403479728042781859417132409211196330970220143068366138013678218577252339479664567297677721479392889259142568573
     18181596744496256100801187627265497767502497759805618365506116476948496583188877736664942705658949813969984633490872244027296363284589271484785662398334292593849075613495660116401151091169659386827725512723279551327809202246167))
   (z (1 0 0))))
 (query
  (((x
     12435558812900127869159781630648459725501210932436336777852934585152596103318911187710842777247584317624938162725043193175965308595329864361538743912161136578643793439761070545824613848749414379475739439981400248587289984764882)
    (y
     12367188524135822562017720812992576815364067541324064405634104631271576911435429284384322142128751019154741210731153740689869626870468674371974781935906216126262323486555193979821329400982111166462402483130768069529054873658070)
    (z 1))
   ((x
     13420594821583078419612001236177406529431076865236166369003036010405655768086954687026217858477927737099570488951535874121420344474770365036493719550408507853342582037655322693304409458264039885544192728657153923402853233167365)
    (y
     13197120368975733692324911848726987319139672584727447769350546542311530068400041185783857840837591683995187092911846271278523021325645288048739074383412798890597988436492955858560337948741164264357896720515788052604075125702788)
    (z 1))
   ((x
     27861541612505086486511489322310096857540958113537572408518455803749741238897152294581515293303586321736320903442436169569802391116876713845112576406954649816925781533700562741155164715646668830087486908294897870997794267171208)
    (y
     14483066015411910810467759405096783990664247212755971670882918479403379702571904179952439503999669731681152546893413565838848958313455003684762947466746103080968050152343020028092073640448059102750301919563863231662070858920502)
    (z 1)))))
  |}

let verification_key =
  Demo.Verification_key.t_of_sexp (Core_kernel.Sexp.of_string key_string)
  |> Demo.Verification_key.Processed.create

let construct_proof a b c delta_prime z = {Demo.Proof.a; b; c; delta_prime; z}

(* let call_hash a b c delta_prime = *)
(*    Demo.Hash.hash ~a ~b ~c ~delta_prime *)

let bigint_of_string s = Snarkette.Nat.of_string (Js.to_string s)

let bigint_to_string bi = Js.string (Snarkette.Nat.to_string bi)

let verify_state_hash state_hash proof =
  Demo.verify verification_key [bigint_of_string state_hash] proof

let () =
  let window = Js.Unsafe.global in
  let snarkette_obj =
    let open Js.Unsafe in
    obj
      [| ("constructProof", inject construct_proof)
       ; ("verificationKey", inject verification_key)
         (* ; ("deserialize", inject(deserialize_buffer)) *)
         (* ; ("deserializeProcessed", inject(deserialize_processed_buffer)) *)
       ; ("verifyStateHash", inject verify_state_hash)
       ; ("bigintOfString", inject bigint_of_string)
       ; ("bigintToString", inject bigint_to_string)
         (* ; ("hash", inject(call_hash)) *) |]
  in
  Js.Unsafe.set window "snarkette" snarkette_obj
