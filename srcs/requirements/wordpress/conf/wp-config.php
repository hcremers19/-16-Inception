<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_DB') );

/** Database username */
define( 'DB_USER', getenv('MARIADB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('MARIADB_PWD') );

/** Database hostname */
define( 'DB_HOST', getenv('MARIADB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'H)+0{4H2Q]6A.+caN)-vk<3lm/9Q@Ff_mSKTyZ#}Jlj%Wz%J`y:-^!}VRQz&I9,/');
define('SECURE_AUTH_KEY',  '8-F!wT3x!HEJyS-?;Z]kDNG|tQg[i0-(e:1qN|-qG(E6$1+<L yKGDB#2)8p6|%>');
define('LOGGED_IN_KEY',    'QokdTd>u_.d=7g->8:)E<%9JL9,zV2K|GDit%SWy:VxTw`[UuVs^VpM~p/[k3a!+');
define('NONCE_KEY',        'Hn4w:50Rm=z+Qh9H_ZkTs Xbp~oJtF_o?^tj(pnFPTLFpZ^}_1OC)IHS(BMC|s.d');
define('AUTH_SALT',        ';WNT|v4|9I$/-B-PlTLc>|UE@ZZju7V}])Uu+.!db|Z,6E}.o)ck6e0_;Px.4~Un');
define('SECURE_AUTH_SALT', '3S=rF.}mG;Oq2x-p_wU7rJ$x:3sW)_]2Tzp~[q}A(FbiZi2wr-Xqmx4E];$}Me.)');
define('LOGGED_IN_SALT',   'E;&_g0+p=C$1B?|A?g/59U[+dNGq5}CB*L0K.yg!V_wbN IU;ui+bBJs|)T/JXDb');
define('NONCE_SALT',       'S2#1c|[unDHo#p@Y0,34xfD2-J|+t_I3=XOlRG,mk*GiuWPL{C?6>|DMw8:VIQz#');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';