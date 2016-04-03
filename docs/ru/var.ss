- namespace docs.ru.api['Директивы']['Переменные']['1::var']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

{template main[%fileName%]() extends base.main}
#{block root}

Директива создаёт переменную/ые с указанным именем и значением.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | `:`                | Блочная       |

## Описание

Переменные в Snakeskin имеют блочную область видимости и по своей семантике напоминают `let` из JS ES2015.

Директива **var** позволяет декларировать сразу несколько переменных через запятую (аналогично как это делается в JS).

Директива начинается с ключевого слова `var` (или символа `:`), которое должно сопровождаться списком имён
создаваемых переменных (через запятую). Для присвоения значений созданной переменной необходимо поставить символ `=` после имени.

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- var a = 1
: b = 2, c, d = 4
```

```classic
{var a = 1 /}
{: b = 2, c, d = 4 /}
```

#{/}

Для удобства использования *var* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{var a = 1}{/}

\/// Короткая форма закрытия
{var b = 2 /}
```

В отличии от JS переменные в Snakeskin декларируются только после места декларации.

#{+= self.example()}

```jade-like
: a = 2
- if true
	? console.log(a) \/// 2
	: a = 1
	? console.log(a) \/// 1
```

```classic
{: a = 2}
{if true}
	{? console.log(a)} \/// 2
	{: a = 1}
	{? console.log(a)} \/// 1
{/}
```

#{/}

Допускается в рамках одного блока создавать переменные с одинаковым именем.

#{+= self.example()}

```jade-like
: a = 2
? console.log(a) \/// 2
: a = 1
? console.log(a) \/// 1
```

```classic
{: a = 2}
{? console.log(a)} \/// 2
{: a = 1}
{? console.log(a)} \/// 1
```

#{/}

С помощью ключевого слова **putIn** можно присвоить переменной фрагмент выражения Snakeskin, однако при такой декларации
допускается создавать только одну переменную за раз, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	: putIn tpl
		- if value !== 404
			< .hello
				Hello World!

		- else
			< .error
				404
```

```classic
{namespace demo}
{template index(value)}
	{: putIn tpl}
		{if value !== 404}
			{< .hello}
				Hello World!

		{else}
			{< .error}
				404
			{/}
		{/}
	{/}
{/template}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	- if true
		: a = 1
		{a}

	{a} \/// Error, a is not defined

	: b = 1
	- if true
		{b} \/// 1

	{b} \/// 1
```

```classic
{namespace demo}
{template index(value)}
	{if true}
		{: a = 1 /}
		{a}
	{/}

	{a} \/// Error, a is not defined

	{: b = 1}
	{if true}
		{b} \/// 1
	{/}

	{b} \/// 1
{/template}
```

#{/}

#{/block}
{/template}