<?php

namespace Application\Common\Models;

class RoleAdmin extends ModelBase
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(column="admin_id", type="integer", length=10, nullable=false)
     */
    public $admin_id;

    /**
     *
     * @var integer
     * @Primary
     * @Column(column="role_id", type="integer", length=10, nullable=false)
     */
    public $role_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("role_admin");
//        $this->belongsTo('admin_id', 'Application\Common\Models\Admins', 'id', ['alias' => 'Admins']);
//        $this->belongsTo('role_id', 'Application\Common\Models\Roles', 'id', ['alias' => 'Roles']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'role_admin';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return RoleAdmin[]|RoleAdmin|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return RoleAdmin|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getRole($admin_id){
        $role_set = array();$role_ids_set = array();
        $phql = "SELECT b.name,b.id FROM c:RoleAdmin a LEFT JOIN c:Roles b ON a.role_id = b.id WHERE admin_id = $admin_id";
        $roles = $this->getModelsManager()->executeQuery($phql);
        foreach ($roles as $role){
            array_push($role_set, $role->name);
            array_push($role_ids_set, $role->id);
        }
        return array($role_set,implode(',', $role_ids_set));
    }
}
