Class Treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{

Property Instrutor As Treinamento.Data.Instrutor [ SqlColumnNumber = 2 ];

Property DataInicio As %Date [ SqlColumnNumber = 3 ];

Property Status As %String [ SqlColumnNumber = 4 ];

Property Alunos As list Of Treinamento.Data.Aluno [ SqlColumnNumber = 5 ];

Property Curso As Treinamento.Data.Curso [ SqlColumnNumber = 6 ];

Method VerificaStatus(curso As %String) As %String [ Language = objectscript ]
{
	Set statusTurma = ""
	Set sql = "SELECT * FROM Treinamento.Data.Turma Where Curso->Nome ='"_curso_"'"
	Set resultSet = ##class(%ResultSet).%New()
	Set status = resultSet.Prepare(sql)
	Set status = resultSet.Execute()
	
	If resultSet.Next() {
		Set statusTurma = resultSet.Get("Status")	 
	}
	Return statusTurma
}

ClassMethod VerificaStatus1(curso As %String) As %String [ Language = objectscript ]
{
	Set statusTurma = ""
	Set sql = "SELECT * FROM Treinamento.Data.Turma Where Curso->Nome ='"_curso_"'"
	Set resultSet = ##class(%ResultSet).%New()
	Set status = resultSet.Prepare(sql)
	Set status = resultSet.Execute()
	
	If resultSet.Next() {
		Set statusTurma = resultSet.Get("Status")	 
	}
	Return statusTurma
}

ClassMethod ImprimeTurma(curso As %String) As %String
{
	Set tsc=$$$OK
    Try {
    Set sql = "SELECT * FROM Treinamento.Data.Turma Where Curso->Nome ='"_curso_"'"
	Set resultSet = ##class(%SQL.Statement).%New()
	Set status = resultSet.Prepare(sql)
	Set status = resultSet.Execute()
    
    If resultSet.Next()
    {
        Set idTurma = resultSet("ID")
        Set turma = ##class(Treinamento.Data.Turma).%OpenId(idTurma)
    }
    For x = 1:1:turma.Alunos.Count()
    {

        Set aluno = turma.GetAt(x)
        W "Nome: "_aluno.Nome," Matricula: "_aluno.Matricula
        
    }
    }
    Catch (exception) {
        Set tsc = exception.AsStatus()
        Set tsc = $SYSTEM.Status.GetErrorText(tsc)
        Throw exception
    }
    Quit
}

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Instrutor</Value>
</Value>
<Value name="3">
<Value>DataInicio</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>Alunos</Value>
</Value>
<Value name="6">
<Value>Curso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^Treinamento.Data.TurmaI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Alunos">
<AverageFieldSize>17</AverageFieldSize>
<OutlierSelectivity>.999999:$lb($lb("1"),$lb("2"),$lb("3"))</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Curso">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="DataInicio">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:67132</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Instrutor">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.999999:"Incompleto"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
