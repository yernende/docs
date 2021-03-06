- namespace docs.en.api['1::Directives']['15::Asynchronous directives']['3::waterfall']

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

Директива является фасадом для [Async.waterfall](https://www.npmjs.com/package/async#waterfall).

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива является обёрткой над функцией waterfall библиотеки Async и позволяет создавать удобные цепочки
асинхронных вызовов. Вместе с директивой *waterfall* должна использоваться директива [func](#func).
Перед использованием директивы необходимо подключить через [import](#import) саму библиотеку Async, например:

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index()
	- waterfall
		() => cb
			fs.readFile('foo.txt', cb)

		() => file1, cb
			fs.readFile('bar.txt', cb)
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index()}
	{waterfall}
		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

		{() => file1, cb}
			fs.readFile('bar.txt', cb)
		{/}
	{/}
{/template}
```

#{/}

The directive can be used anywhere. Вместе с основной
директивой можно использовать дополнительные:

1. `final` - второй параметр Async.waterfall ([функциональная директива](#{@@guide}#introParams)).

Для управления переходами внутри блока можно использовать директивы:

1. [break](#break) - прерывает выполнение операции и переходит в *final* (если он задан), может принимать параметр;
2. [continue](#continue) - прерывает выполнение текущей функции и переходит к следующей (если она есть) или
к *final* (если он задан), может принимать параметр.

### Examples
#### Задание final

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index()
	- waterfall
		() => cb
			fs.readFile('foo.txt', cb)

	- final err, files
		? console.log(err, files)
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index()}
	{waterfall}
		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

	{final err, res}
		{? console.log(err, files)}
	{/}
{/template}
```

#{/}

#### Сброс операции

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index(brk)
	- waterfall
		() => cb
			- if brk
				- break new Error('Skipped')

			? cb()

		() => cb
			fs.readFile('foo.txt', cb)

	- final err, res
		...
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index(brk)}
	{waterfall}
		{() => cb}
			{if brk}
				{break new Error('Skipped')}
			{/}

			{? cb()}
		{/}

		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

	{final err, res}
		...
	{/}
{/template}
```

#{/}

#{/block}
{/template}
