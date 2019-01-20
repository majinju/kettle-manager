select
===
* 注释

	select #use("cols")# from t_sys_zd_tyzd where #use("condition")#

cols
===

	ID,DM,MC,MS,PX,JP,QP,ZDLB,BZZDLB,LBSQL,CREATEDATE,ETLDATE,SJLY,ISDEL,UPNODE,CACHE

update
===

	ID=#id#,DM=#dm#,MC=#mc#,MS=#ms#,PX=#px#,JP=#jp#,QP=#qp#,ZDLB=#zdlb#,BZZDLB=#bzzdlb#,LBSQL=#lbsql#,CREATEDATE=#createdate#,ETLDATE=#etldate#,SJLY=#sjly#,ISDEL=#isdel#,UPNODE=#upnode#,CACHE=#cache#

condition
===

	1 = 1  
	@if(!isEmpty(dm)){
	 and DM like %#dm#%
	@}
	@if(!isEmpty(mc)){
	 and MC=#mc#
	@}
	@if(!isEmpty(ms)){
	 and MS=#ms#
	@}
	@if(!isEmpty(px)){
	 and PX=#px#
	@}
	@if(!isEmpty(jp)){
	 and JP=#jp#
	@}
	@if(!isEmpty(qp)){
	 and QP=#qp#
	@}
	@if(!isEmpty(zdlb)){
	 and ZDLB=#zdlb#
	@}
	@if(!isEmpty(bzzdlb)){
	 and BZZDLB=#bzzdlb#
	@}
	@if(!isEmpty(lbsql)){
	 and LBSQL=#lbsql#
	@}
	@if(!isEmpty(createdate)){
	 and CREATEDATE=#createdate#
	@}
	@if(!isEmpty(etldate)){
	 and ETLDATE=#etldate#
	@}
	@if(!isEmpty(sjly)){
	 and SJLY=#sjly#
	@}
	@if(!isEmpty(isdel)){
	 and ISDEL=#isdel#
	@}
	@if(!isEmpty(upnode)){
	 and UPNODE=#upnode#
	@}
	@if(!isEmpty(cache)){
	 and CACHE=#cache#
	@}