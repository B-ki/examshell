const formats = require('../formats');

module.exports = {
	name: 'status',
	description: 'Print status of current examen',
	exec: (_commands, JSON, _LANG, TIMER, GRADEME) =>
	{
		GRADEME.print_info();
		if (!JSON.options.infinite)
		{
			console.log('╓───────────────────╖');
			console.log('║        ⏰         ║');
			console.log(`║      ${formats.foreground.normal.green}${TIMER.isRet.days.toString().padStart(2, 0)}${formats.format.reset} days      ║`);
			console.log(`║    ${formats.foreground.normal.cyan}${TIMER.isRet.hours.toString().padStart(2, 0)}${formats.format.reset}h ${formats.foreground.normal.cyan}${TIMER.isRet.minutes.toString().padStart(2, 0)}${formats.format.reset}m ${formats.foreground.normal.cyan}${TIMER.isRet.seconds.toString().padStart(2, 0)}${formats.format.reset}s    ║`);
			console.log('╙───────────────────╜\n');
		}
		else
		{
			console.log('╓───────────────────╖');
			console.log('║        ⏰         ║');
			console.log('║        ♾          ║');
			console.log('╙───────────────────╜\n');
		}
	},
};
