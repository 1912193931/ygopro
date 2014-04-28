--ドゥーブルパッセ
function c79997591.initial_effect(c)
	--change battle target
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(79997591,0))
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetCondition(c79997591.cbcon)
	e1:SetOperation(c79997591.cbop)
	c:RegisterEffect(e1)
end
function c79997591.cbcon(e,tp,eg,ep,ev,re,r,rp)
	local bt=Duel.GetAttackTarget()
	return bt and bt:IsPosition(POS_FACEUP_ATTACK) and bt:IsControler(tp)
end
function c79997591.cbop(e,tp,eg,ep,ev,re,r,rp)
	local bt=Duel.GetAttackTarget()
	Duel.ChangeAttackTarget(nil)
	if bt:IsRelateToBattle() and bt:IsControler(tp) then
		Duel.Damage(1-tp,bt:GetAttack(),REASON_EFFECT)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DIRECT_ATTACK)
		e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+RESET_END+RESET_SELF_TURN)
		bt:RegisterEffect(e1)
	end
end
