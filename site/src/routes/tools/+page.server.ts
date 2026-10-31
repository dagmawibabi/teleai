import { groups, sourceCount, toolCount } from '#lib/data/catalogue.js';

export const prerender = true;
export const load = () => {
	// Every tool the app has must land in a group.
	if (toolCount !== sourceCount) {
		throw new Error(`The catalogue shows ${toolCount} of ${sourceCount} tools; add the missing category.`);
	}
	return { groups, toolCount };
};
