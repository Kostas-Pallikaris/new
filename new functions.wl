(* ::Package:: *)

(* ::Title:: *)
(*New Functions*)


(* ::Input:: *)
(*Quit[]*)


(* ::Section:: *)
(*Building the geometry*)


(* ::Subsection::Closed:: *)
(*Loading the packages*)


(* ::Input:: *)
(*<<xAct`xTensor`*)
(*<<xAct`xPert`*)
(*<<xAct`SymManipulator`*)
(*<<xAct`xTras`*)


(* ::Subsection::Closed:: *)
(*Definitions*)


(* ::Input:: *)
(*DefManifold[M, 4, {\[Alpha],\[Beta],\[Zeta],\[Kappa],\[Lambda],\[Mu],\[Nu],\[Rho],\[Sigma],\[Alpha]1,\[Alpha]2,\[Alpha]3,\[Alpha]4,\[Beta]1,\[Beta]2,\[Beta]3,\[Beta]4}];*)
(*DefMetric[-1,g[-\[Alpha],-\[Nu]],CD,SymbolOfCovD->{";","\!\(\*OverscriptBox[\(\[Del]\), \(\[EmptySmallCircle]\)]\)"},PrintAs->"g"];*)
(*DefVBundle[fake,M,4,{a,b,c,d,e,f,r,s,t,q,p,a1,a2,a3,a4}];*)
(*DefCovD[CD0[-\[Alpha]],{";","\!\(\*OverscriptBox[\(\[Del]\), \(\[FilledSmallCircle]\)]\)"},FromMetric-> g,Torsion-> True,Curvature-> False];*)
(*DefCovD[VD[-\[Alpha]],fake,{"|","\!\(\*OverscriptBox[\(D\), \(\[EmptySmallCircle]\)]\)"},ExtendedFrom-> CD];*)
(*DefCovD[VD0[-\[Alpha]],fake,{"|","\!\(\*OverscriptBox[\(D\), \(\[FilledSmallCircle]\)]\)"},ExtendedFrom-> CD0,Torsion-> True,Curvature-> False];*)


(* ::Subsection::Closed:: *)
(*Splitter*)


(* ::Input:: *)
(*Options[Splitter]={"FullSplit"->True,"SeparateDenominator"->False};*)
(**)
(*Splitter[Expr_,OptionsPattern[]]:=( *)
(**)
(*origin=ToString[InputForm[PowerExpand[Expand[ScreenDollarIndices[Expr]]]]];*)
(**)
(*(*Print[origin];*)*)
(**)
(*genpos=StringPosition[origin,"^("];*)
(**)
(*If[genpos!={},*)
(**)
(**)
(*genpos=StringPosition[origin,"^("];*)
(**)
(*(*Length[genpos];*)*)
(**)
(*(*Determine how many ^( cases there are *)*)
(**)
(*Donepart="";*)
(**)
(*Do[*)
(**)
(*(**)
(*Print["*)
(*Case "<>ToString[iter]<>"*)
(*"];*)
(**)*)
(**)
(*pos=StringPosition[origin,"^("];*)
(*pos2=StringPosition[origin,")"];*)
(**)
(*chorigin=Characters[origin];*)
(**)
(*If[pos2[[1,1]]<pos[[1,1]],*)
(**)
(*(*Print["Yes"];*)*)
(**)
(*(*Donepart=ToString[ToString[Donepart]<>ToString[StringJoin[chorigin[[1;;pos2[[1,1]]]]]]];*)*)
(*Donepart=ToString[ToString[Donepart]<>ToString[StringJoin[chorigin[[1;;pos[[1,1]]-1]]]]];*)
(**)
(*(*chorigin=chorigin[[pos2[[1,1]]+1;;-1]];*)*)
(*chorigin=chorigin[[pos[[1,1]];;-1]];*)
(**)
(*(*Print[chorigin];*)*)
(**)
(*pos=StringPosition[StringJoin[chorigin],"^("];*)
(*pos2=StringPosition[StringJoin[chorigin],")"];*)
(**)
(*];*)
(**)
(*(*exp to characters*)*)
(**)
(*bpos=0;*)
(*Count1=1;*)
(*Count2=2;*)
(**)
(**)
(*While[Count1!=Count2,*)
(**)
(*Part1=chorigin[[1;;pos[[1,1]]]];*)
(*(*Up to first ^*)*)
(**)
(*Part2=chorigin[[pos[[1,2]];;pos2[[1+bpos,1]]]];*)
(*(*from Power ( to frist )*)*)
(**)
(*(**)
(*Print["Part1 "<>ToString[StringJoin[Part1]]];*)
(*Print["Part2 "<>ToString[StringJoin[Part2]]];*)
(**)*)
(**)
(*Count1=Count[Part2,"("];*)
(*Count2=Count[Part2,")"];*)
(**)
(*bpos=bpos+Abs[Count1-Count2]*)
(*(*Counting Descrepancy between no of ( and )*)*)
(**)
(*(**)
(*Print[ToString[{"(",")"}] <> ToString[{Count1,Count2}]]*)
(**)*)
(**)
(*];*)
(**)
(*Part2=Characters[StringReplace[StringJoin[Part2],{"+"->"PowerPlus","-"->"PowerMinus","/"->"PowerDivi","*"->"PowerMulti"}]];*)
(*Part3=chorigin[[pos2[[1+bpos,1]]+1;;-1]];*)
(**)
(*(*Replacing + - / and conserving rest in Part3*)*)
(**)
(*(**)
(*Print["Part1 "<>ToString[StringJoin[Part1]]];*)
(*Print["Part2 "<>ToString[StringJoin[Part2]]];*)
(*Print["Part3 "<>ToString[StringJoin[Part3]]];*)
(**)*)
(**)
(*(*Print[Donepart];*)*)
(**)
(*Donepart=ToString[ToString[Donepart]<>ToString[StringJoin[Join[Part1,Part2]]]];*)
(**)
(*(*Print[Donepart];*)*)
(**)
(*(*Storing converted part*)*)
(**)
(*origin=StringJoin[Part3];*)
(**)
(*(*Storing remainingpart*)*)
(*,*)
(**)
(*{iter,1,Length[genpos]}];*)
(**)
(*Donepart=ToString[ToString[Donepart]<>ToString[StringJoin[Part3]]];*)
(**)
(*origin=Donepart;*)
(**)
(*];*)
(**)
(*(*Print[origin];*)*)
(**)
(*InitialEXPBadList=StringReplace[StringSplit[StringReplace[StringReplace[origin," "->""],{"[-"->"BracNeg",",-"->"ComNeg","{-"->"CurlyNeg","^-"->"PowNeg"}],{"+","-"->"-"}],{"PowerPlus"->"+","PowerMinus"->"-","BracNeg"->"[-","ComNeg"->",-","CurlyNeg"->"{-","PowNeg"->"^-"}];*)
(*(* Original expression expanded to string and removeal of space, replacment of index and power "-" for safekeeping,splitting at + and - (non index) and putting-as element in list, replacement of index and power "-" *)*)
(**)
(*(*Print[InitialEXPBadList];*)*)
(**)
(*Do[If[InitialEXPBadList[[x]]=="-",InitialEXPBadList[[x+1]]=ToString["-"<>InitialEXPBadList[[x+1]]]],{x,Length[InitialEXPBadList]}];*)
(*InitialEXPList=DeleteCases[InitialEXPBadList,"-"];*)
(**)
(*(* Attachment of - (nonindex) to appropreate list element and removal of now redundant-elements *)*)
(**)
(*(**)
(*Print[ToString["InitialEXPList  "<> ToString[InitialEXPList]<>"\n"]];*)
(**)*)
(**)
(*If[OptionValue["FullSplit"]==False,Return[ToExpression[StringReplace[InitialEXPList,{"PowerMulti"->"*","PowerDivi"->"/"}]]],*)
(**)
(*Do[*)
(**)
(*(*If[StringJoin[Characters[InitialEXPList[[ele]]][[1;;2]]]\[Equal]"-("&&Characters[InitialEXPList[[ele]]][[-1]]\[Equal]")",InitialEXPList[[ele]]="-"<>StringDrop[StringDrop[InitialEXPList[[ele]],2],-1]];*)
(*(*In case of numerator brackets with a negative sign eliminate such brakets and reattach "-" sign*)*)*)
(**)
(*InitialEXPList[[ele]]=StringSplit[InitialEXPList[[ele]],"/"];*)
(**)
(*,{ele,1,Length[InitialEXPList]}]*)
(**)
(*(*Account for bracket due to negative sign encompasing all expression and split of expression denominator from the rest*)*)
(**)
(*(*Print[InitialEXPList]*)*)
(**)
(*Do[*)
(**)
(*If[Length[InitialEXPList[[ele2]]]>1,*)
(*divi=InitialEXPList[[ele2]][[2]]; *)
(*If[Characters[divi][[1]]=="("&&Characters[divi][[-1]]==")",divi=StringDrop[StringDrop[divi,1],-1]],divi=Null];*)
(**)
(*str=InitialEXPList[[ele2]][[1]];*)
(**)
(*(**)
(*Print[ToString[str]<>"\n"];*)
(**)*)
(**)
(*If[str!="1",*)
(*If[StringJoin[Characters[str][[1;;2]]]=="-("&&Characters[str][[-1]]==")",str="-"<>StringDrop[StringDrop[str,2],-1]]*)
(*];*)
(*(*In case of numerator brackets with a negative sign eliminate such brakets and reattach "-" sign*)*)
(**)
(*(**)
(*Print[ToString[str]<>"\n"];*)
(**)*)
(**)
(*If[Characters[str][[1]]=="("&&Characters[str][[-1]]==")",str=StringDrop[StringDrop[str,1],-1]];*)
(*(*If it exists storing denominator in divi*)*)
(**)
(**)
(*(*Print["{str,divi}  "<>ToString[{str,divi}]];*)*)
(**)
(*If[str==Null,str="1"];*)
(*If[divi==Null,divi="1"];*)
(**)
(*str=StringSplit[str,"*"];*)
(*divi=StringSplit[divi,"*"];*)
(**)
(*str=DeleteCases[str,"1"];*)
(*divi=DeleteCases[divi,"1"];*)
(**)
(*NumList=Function[StringReplace[#,{"PowerDivi"->"/","PowerMulti"->"*"}]][str];*)
(*DenList=Function[StringReplace[#,{"PowerDivi"->"/","PowerMulti"->"*"}]][divi];*)
(**)
(**)
(*Do[*)
(**)
(*(*Print[NumList[[iter]]];*)*)
(**)
(*pos1=Length[StringPosition[NumList[[iter]],"("]];*)
(*pos2=Length[StringPosition[NumList[[iter]],")"]];*)
(**)
(*If[pos1>pos2,*)
(**)
(*(*Print["Yes"];*)*)
(**)
(*Do[NumList[[iter]]=StringJoin[NumList[[iter]],")"],*)
(**)
(*{iter2,1,Abs[pos1-pos2]}]*)
(**)
(*];*)
(**)
(*If[pos1<pos2&&Characters[NumList[[iter]]][[-1]]==")",*)
(**)
(*(*Print["Yes"];*)*)
(**)
(*Do[NumList[[iter]]=StringDrop[NumList[[iter]],-1],*)
(**)
(*{iter2,1,Abs[pos1-pos2]}]*)
(**)
(*],*)
(**)
(*{iter,1,Length[NumList]}];*)
(**)
(**)
(*Do[*)
(**)
(*(*Print[DenList[[iter]]];*)*)
(**)
(*pos1=Length[StringPosition[DenList[[iter]],"("]];*)
(*pos2=Length[StringPosition[DenList[[iter]],")"]];*)
(**)
(*If[pos1>pos2,*)
(**)
(*(*Print["Yes"];*)*)
(**)
(*Do[DenList[[iter]]=StringJoin[DenList[[iter]],")"],*)
(**)
(*{iter2,1,Abs[pos1-pos2]}]*)
(**)
(*];*)
(**)
(*If[pos1<pos2&&Characters[DenList[[iter]]][[-1]]==")",*)
(**)
(*(*Print["Yes"];*)*)
(**)
(*Do[DenList[[iter]]=StringDrop[DenList[[iter]],-1],*)
(**)
(*{iter2,1,Abs[pos1-pos2]}]*)
(**)
(*],*)
(**)
(*{iter,1,Length[DenList]}];*)
(**)
(**)
(**)
(*(*Print["{NumList,DenList}  "<>ToString[{NumList,DenList}]];*)*)
(**)
(*Do[DenList[[iter]]=ToString["1/"<>ToString[DenList[[iter]]]],{iter,1,Length[DenList]}];*)
(**)
(**)
(*If[OptionValue["SeparateDenominator"]==True,*)
(*InitialEXPList[[ele2]]={NumList,DenList},*)
(*InitialEXPList[[ele2]]=Join[NumList,DenList];*)
(*],*)
(**)
(*(**)
(*Print[InitialEXPList[[ele2]]];*)
(**)
(*Print[InitialEXPList],*)
(**)
(**)*)
(**)
(**)
(*{ele2,1,Length[InitialEXPList]}];*)
(**)
(*(*Print[InitialEXPList];*)*)
(*Return[InitialEXPList]*)
(**)
(*]*)
(**)
(*)*)


(* ::Section:: *)
(*Functions*)


(* ::Subsection::Closed:: *)
(*Read Indices*)


(* ::Input:: *)
(*DefTensor[viel[a,-\[Mu]],{fake,M},PrintAs-> "e"]*)
(*VD0[-\[Nu]]@viel[a,-\[Mu]]//CovDToChristoffel//InputForm*)


(* ::Input:: *)
(*ReadIndices[exp_,obj_]:= Module[*)
(*{listoflists,pos,term,IndLimits,i,TempList,lind},*)
(*listoflists=Splitter[exp,"FullSplit"-> True];*)
(*pos=Position[ToExpression@listoflists,obj];*)
(*TempList=Range[Length@pos];*)
(*For[i=1,i<= Length@pos,i++,*)
(*term=listoflists[[pos[[i,1]],pos[[i,2]]]];*)
(*IndLimits=StringPosition[term,{"[","]"}];*)
(*lind=Length@IndLimits;*)
(*TempList[[i]]= StringSplit[StringTake[term,{IndLimits[[lind-1,1]]+1,IndLimits[[lind,1]]-1}],","];*)
(*];*)
(*Return@TempList;*)
(*]*)


(* ::Input:: *)
(*ReadIndices[VD0[-\[Nu]]@viel[a,-\[Mu]]//CovDToChristoffel,AChristoffelVD0]*)
(*ReadIndices[VD0[-\[Nu]]@viel[a,-\[Mu]]//CovDToChristoffel,ChristoffelCD0]*)


(* ::Subsection::Closed:: *)
(*Change Convention*)


(* ::Input:: *)
(*ChangeConvention[exp_,obj_]:= Module[*)
(*{listoflists,pos,term,NewTerm,IndList,TempList,final,l,j},*)
(*listoflists=Splitter[exp,"FullSplit"-> True];*)
(*pos=Position[ToExpression@listoflists,obj];*)
(*For[j=1,j<= Length[pos],j++,*)
(*term=ToExpression@listoflists[[pos[[j,1]],pos[[j,2]]]];*)
(*IndList=ReadIndices[exp,obj];*)
(*NewTerm=ReplaceIndex[Evaluate@term,{ToExpression@IndList[[j,2]]-> ToExpression@IndList[[j,3]],ToExpression@IndList[[j,3]]-> ToExpression@IndList[[j,2]]}];*)
(*listoflists[[pos[[j,1]],pos[[j,2]]]]=ToString@NewTerm;*)
(*];*)
(*For[l=1,l<= Length@listoflists,l++,*)
(*listoflists[[l]]=StringJoin[Riffle@@{listoflists[[l]],"*"}];*)
(*];*)
(*final=ToExpression[StringReplace[StringJoin@Riffle[listoflists," + "]," + - "-> " - "]];*)
(*Return@final;*)
(*]*)


(* ::Input:: *)
(*ChangeConvention[VD0[-\[Nu]]@viel[a,-\[Mu]]//CovDToChristoffel,AChristoffelVD0]*)
(*ChangeConvention[%,ChristoffelCD0]*)


(* ::Input:: *)
(*DefTensor[Dum[a,-b,-c],fake,PrintAs-> "V"]*)


(* ::Input:: *)
(*VD0[-\[Nu]]@Dum[a,-b,-c]//CovDToChristoffel*)
(*ChangeConvention[%,AChristoffelVD0]*)


(* ::Input:: *)
(*UndefTensor[Dum]*)


(* ::Subsection:: *)
(*Fock-Ivanenko Covariant Derivative*)


(* ::Text:: *)
(*This derivative is mandatory to our work, so we will have to implement it. *)


(* ::Input:: *)
(*DefCovD[FIVD0[-\[Alpha]],fake,{"|","\!\(\*OverscriptBox[\(\[ScriptCapitalD]\), \(\[FilledSmallCircle]\)]\)"},Torsion-> True,Curvature-> False];*)


(* ::Input:: *)
(*FIVDToSpinConnection[exp_,fivd_,covd_]:= Module[*)
(*{listoflists,temp,pos,i,holder,temp2,l,final},*)
(*     listoflists=Splitter[exp//CovDToChristoffel,"FullSplit"-> True]; *)
(*temp=List["Christoffel"];*)
(*temp=StringJoin[temp,ToString@fivd];*)
(*pos=Position[ToExpression@listoflists,ToExpression@temp];*)
(*For[i=1,i<=Length@pos,i++,*)
(*listoflists[[pos[[i,1]],pos[[i,2]]]]="0";*)
(*];*)
(*temp=List["AChristoffel"];*)
(*temp=StringJoin[temp,ToString@fivd];*)
(*temp2=StringJoin[List["AChristoffel"],ToString@covd];*)
(*pos=Position[ToExpression@listoflists,ToExpression@temp];*)
(*For[i=1,i<=Length@pos,i++,*)
(*holder=listoflists[[pos[[i,1]],pos[[i,2]]]];*)
(*listoflists[[pos[[i,1]],pos[[i,2]]]]=StringReplace[holder, temp-> temp2];*)
(*];*)
(*For[l=1,l<= Length@listoflists,l++,*)
(*listoflists[[l]]=StringJoin[Riffle@@{listoflists[[l]],"*"}];*)
(*];*)
(*final=ToExpression[StringReplace[StringJoin@Riffle[listoflists," + "]," + - "-> " - "]];*)
(*Return@ChangeConvention[final,ToExpression@temp2];*)
(*]*)


(* ::Input:: *)
(*DefTensor[Dum[a,b,\[Nu]],{fake,fake,M},PrintAs-> "V"]*)
(*DefTensor[Dum2[a,b,\[Nu]],{fake,fake,M},PrintAs-> "W"]*)


(* ::Input:: *)
(*FIVD0[-\[Alpha]][Dum[a,b,-\[Nu]]]*)
(*FIVDToSpinConnection[%,FIVD0,VD0]*)
(*FIVD0[-\[Alpha]][Dum[a,b,-\[Nu]]]Dum2[-b,-c,-\[Rho]]+FIVD0[-\[Alpha]][Dum2[b,a,-\[Nu]]]Dum[-c,-b,-\[Rho]]*)
(*FIVDToSpinConnection[%,FIVD0,VD0]*)


(* ::Input:: *)
(*UndefTensor[Dum]*)
(*UndefTensor[Dum2]*)


(* ::Subsection::Closed:: *)
(*Symmetry in 2 indices - Rank n tensors*)


(* ::Input:: *)
(*CollectSymPair[exp_,obj_]:=Module[*)
(*{listoflists,IndList,pos,temp,i,j,k,TempTensor,TempInd,final,l,h,temp2,temp3},*)
(*listoflists=Splitter[exp,"FullSplit"-> True];*)
(*pos=Position[ToExpression@listoflists,obj];*)
(*temp=Range[Length@pos];*)
(*For[i=1,i<= Length@pos,i++,*)
(*If[NumericQ[ToExpression@First@listoflists[[pos[[i,1]]]]]==False,*)
(*If[First@Characters@listoflists[[pos[[i,1]],1]]== "-",*)
(*temp[[i]]="-1";*)
(*listoflists[[pos[[i,1]],1]]=StringTrim[listoflists[[pos[[i,1]],1]],"-"];*)
(*listoflists[[pos[[i,1]]]]=Prepend[listoflists[[pos[[i,1]]]],temp[[i]]]*)
(*,*)
(*temp[[i]]="1";*)
(*listoflists[[pos[[i,1]]]]=Prepend[listoflists[[pos[[i,1]]]],temp[[i]]]*)
(*];*)
(*];*)
(*];*)
(*IndList=ReadIndices[exp,obj];*)
(*pos=Position[ToExpression@listoflists,obj];*)
(*(*Rank n tensors*)*)
(*For[j=1,j<= Length@IndList,j++,*)
(*For[k=j+1,k<=Length@IndList,k++,*)
(*temp2=Delete[listoflists,{{pos[[j,1]],1},{pos[[k,1]],1},{pos[[j,1]],pos[[j,2]]},{pos[[k,1]],pos[[k,2]]}}];*)
(*temp3=(temp2[[pos[[j,1]]]]== temp2[[pos[[k,1]]]]);*)
(*For[l=1,l<= Length@IndList[[1]]-1,l++,*)
(*For[h=l+1,h<= Length@IndList[[1]],h++,*)
(*If[({IndList[[j,l]],IndList[[j,h]]}==Reverse[{IndList[[k,l]],IndList[[k,h]]}]&& Abs@ToExpression@listoflists[[pos[[j,1]],1]]== Abs@ToExpression@listoflists[[pos[[k,1]],1]]),*)
(*If[(temp3==True && StringFreeQ[listoflists[[pos[[j,1]],pos[[j,2]]]],"SymH"]),*)
(*TempInd=StringJoin[{"["},Riffle@@{IndList[[j]],","},{"]"}];*)
(*If[listoflists[[pos[[j,1]],1]]==listoflists[[pos[[k,1]],1]],*)
(*TempTensor=ImposeSym[ToExpression@listoflists[[pos[[j,1]],pos[[j,2]]]],ToExpression[StringJoin@{"IndexList",TempInd}],Symmetric[{l,h}]],*)
(*TempTensor=ImposeSym[ToExpression@listoflists[[pos[[j,1]],pos[[j,2]]]],ToExpression@StringJoin@{"IndexList",TempInd},Antisymmetric[{l,h}]];*)
(*];*)
(*listoflists[[pos[[k,1]],pos[[k,2]]]]="0";*)
(*listoflists[[pos[[j,1]],pos[[j,2]]]]=ToString[2*TempTensor,InputForm];*)
(*IndList[[k]]=Range[Length@IndList[[k]]];*)
(*];*)
(*];*)
(*];*)
(*];*)
(*];*)
(*];*)
(*For[l=1,l<= Length@listoflists,l++,*)
(*listoflists[[l]]=StringJoin[Riffle@@{listoflists[[l]],"*"}];*)
(*];*)
(*final=ToExpression[StringReplace[StringJoin@Riffle[listoflists," + "]," + - "-> " - "]];*)
(*Return@final;*)
(*]*)


(* ::Input:: *)
(*DefTensor[Dum[a,b,c],fake,PrintAs-> "V"]*)
(*DefTensor[Dam[a,b,c],fake,PrintAs-> "W"]*)
(*DefTensor[Dum2[a,b,c,d],fake,PrintAs-> "U"]*)


(* ::Input:: *)
(*Dum[b,a,c]Dam[-c,d,e]-Dum[a,b,c]Dam[-c,d,e]+2Dam[b,a,c]Dum[-c,d,e]+2Dam[c,a,b]Dum[-c,d,e]+Dum2[b,a,d,e]+3Dum2[a,b,d,e]-3Dum2[a,e,d,b]*)
(*CollectSymPair[%,Dum]*)
(*CollectSymPair[%,Dam]*)
(*CollectSymPair[%,Dum2]*)


(* ::Input:: *)
(*UndefTensor[Dum]*)
(*UndefTensor[Dum2]*)
(*UndefTensor[Dam]*)


(* ::Input:: *)
(*TorsionCD0[-\[Beta],-\[Mu],\[Alpha]]+TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]//TorsionToChristoffel*)
(*CollectSymPair[TorsionCD0[-\[Beta],-\[Mu],\[Alpha]]+TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]//TorsionToChristoffel,ChristoffelCD0]*)


(* ::Subsection::Closed:: *)
(*Christoffel To Torsion*)


(* ::Text:: *)
(*Let us think of the torsion tensor*)


(* ::Input:: *)
(*TorsionCD0[-\[Beta],-\[Mu],\[Alpha]]+TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]//TorsionToChristoffel//InputForm*)


(* ::Text:: *)
(*Let us write it in a denser way*)


(* ::Input:: *)
(*CollectSymPair[%,ChristoffelCD0]//InputForm*)


(* ::Text:: *)
(*We should try to make a rule, which replaces this expression with the torsion tensor. *)


(* ::Input:: *)
(*ChristoffelToTorsion=MakeRule[{2*SymH[{ChristoffelCD0},Antisymmetric[{2,3}],"[23]"][\[Alpha],-\[Beta],-\[Mu]],TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]},MetricOn-> All,UseSymmetries-> True, ContractMetrics-> True]*)


(* ::Text:: *)
(*MakeRule seems incapable of accepting SymManipulator expressions as input (it only accepts them as output). Hence, we can start by building a function for this specific example. *)


(* ::Input:: *)
(*Clear[ChristoffelToTorsion]*)
(*ChristoffelToTorsion[exp_,covd_]:=Module[*)
(*{listoflists,temp,TempExp,pos,i,indices,term,IndLimits,TempList,l,final},*)
(*listoflists=Splitter[exp,"FullSplit"-> True];*)
(*temp=List["Christoffel"];*)
(*temp=StringJoin[temp,ToString@covd];*)
(*TempExp=CollectSymPair[exp,ToExpression@temp];*)
(*listoflists=Splitter[TempExp,"FullSplit"-> True];*)
(*pos=Position[ToExpression@listoflists,SymH];*)
(*temp=StringJoin["Torsion",ToString@covd];*)
(*TempList=Range[Length@pos];*)
(*For[i=1,i<= Length@pos, i++,*)
(*term=listoflists[[pos[[i,1]],pos[[i,2]]]];*)
(*IndLimits=StringPosition[term,{"[","]"}];*)
(*TempList=StringDrop[term,{IndLimits[[(Length@IndLimits-1),1]],IndLimits[[Length@IndLimits,1]]}];*)
(*listoflists[[pos[[i,1]],pos[[i,2]]]]=StringReplace[term,TempList-> StringJoin["(1/2)",temp]];*)
(*];*)
(*For[l=1,l<= Length@listoflists,l++,*)
(*listoflists[[l]]=StringJoin[Riffle@@{listoflists[[l]],"*"}];*)
(*];*)
(*final=ToExpression[StringReplace[StringJoin@Riffle[listoflists," + "]," + - "-> " - "]];*)
(*Return@final;*)
(*]*)


(* ::Input:: *)
(*(TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]+TorsionCD0[-\[Beta],-\[Mu],\[Alpha]])//TorsionToChristoffel*)
(*ChristoffelToTorsion[(TorsionCD0[\[Alpha],-\[Beta],-\[Mu]]+TorsionCD0[-\[Beta],-\[Mu],\[Alpha]])//TorsionToChristoffel,CD0]*)



