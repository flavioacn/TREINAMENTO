Class Treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String(MAXLEN = 200) [ SqlColumnNumber = 2 ];

Property Matricula As %Integer [ SqlColumnNumber = 3 ];

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Matricula</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^Treinamento.Data.TurmaI</IndexLocation>
<StreamLocation>^Treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
