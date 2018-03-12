<?php

namespace Application\Common\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Admins extends ModelBase
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(column="id", type="integer", length=10, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(column="name", type="string", length=255, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(column="email", type="string", length=255, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(column="password", type="string", length=60, nullable=false)
     */
    public $password;

    /**
     *
     * @var string
     * @Column(column="nick", type="string", length=64, nullable=false)
     */
    public $nick;

    /**
     *
     * @var string
     * @Column(column="avatar", type="string", length=255, nullable=false)
     */
    public $avatar;

    /**
     *
     * @var string
     * @Column(column="remember_token", type="string", length=100, nullable=true)
     */
    public $remember_token;

    /**
     *
     * @var string
     * @Column(column="created_at", type="string", nullable=true)
     */
    public $created_at;

    /**
     *
     * @var string
     * @Column(column="updated_at", type="string", nullable=true)
     */
    public $updated_at;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("admins");
        $this->hasMany('id', 'Application\Common\Models\RoleAdmin', 'admin_id', ['alias' => 'RoleAdmin']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'admins';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Admins[]|Admins|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Admins|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getRole(){
        $phql = "SELECT * FROM c:RoleAdmin WHERE c:RoleAdmin.admin_id = 1";
        $result = $this->getModelsManager()->executeQuery($phql);
        return $result;
    }

    public static function adminCount($where){
        return parent::count($where);
    }

    public static function adminList($where,$offset,$limit,$fields){
        $parameters = $where;
        array_push($parameters, array('limit'=>$limit));
        return parent::find($parameters);
    }

}
