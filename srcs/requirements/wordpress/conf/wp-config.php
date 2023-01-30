<?php
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   wp-config.php                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/18 16:22:49 by hcremers          #+#    #+#             */
/*   Updated: 2023/01/25 15:46:00 by hcremers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

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
define('AUTH_KEY',         'ewsHc]n!Wp4 ;~;N4b6}X0:}LB23-*h@k o3Y^kTl|0G<L,?#KYn@+XJ^S/Qz=xF');
define('SECURE_AUTH_KEY',  '+aTBd6I!.]=veW!3;YB:Cj~4zq`3wFie!d3AEyejE]Nks1c.;e)jok/62cGY%_t@');
define('LOGGED_IN_KEY',    'Iv() ?Cv7hMYH7Zd6}BJcd.M4mNr&cyrPR7F^*2R?uM-@}`XneV4Pud#&j2P|{.*');
define('NONCE_KEY',        'j!zg~)<~]QJ&e d./B^wl9/!+J6 s7ht347KCGL~xKSg}Rd/d(JEl0#Krt+~38?b');
define('AUTH_SALT',        '0B6@.LD]|h@+okdF)cF$f{^L-Z,}2SbL;u[9YwOyO)2go::?TWk+X,q?E$LXW&;P');
define('SECURE_AUTH_SALT', 'D-P%_7E+fqFNPXWu0d;OuW5hj>|j7cyD|<k.@q+`O8kh@3]i5Zfibm3ky |=nax|');
define('LOGGED_IN_SALT',   'C#})IJ0-m<<XHsoSf:L0K_21j7ByOODv>DCH0eQ`(W$ YTtn5VboyWK@@4/1`<Xz');
define('NONCE_SALT',       'v+nH j|hq;s$63ZZBdYdg]<UTiBrNWO#/yCBH!83;LB-h3^ISDvEh||e76geV M#');
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